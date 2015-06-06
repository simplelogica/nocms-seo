# NoCMS Seo

## What's this?

This is a Rails engine with a series of models and presenters developed to easily add SEO functionality to a site in a clean a non-intrusive way. Or at least we try.


## How do I install it?

Right now there's no proper gem, although we have a couple of projects making extensive use of it.

To install it just put the repo in your Gemfile:

```ruby
gem "nocms-seo", git: 'git@github.com:simplelogica/nocms-seo.git'
```

And then import all the migrations:

```
rake no_cms_seo:install:migrations
```

And run them

```
rake db:migrate
```

## How does it works?

NoCMS SEO allows you to create presenters where you can encapsulate all the usual SEO functionality (title, description, canonical urls...) without mixing it with your proper (often quite complex) models and helping to keep your app clean and maintainable.

It also adds a model with a polymorphic relationship that can store SEO information on a database without having to store it in your models and a concern that takes care of adding this relationship.

### Model and concern

The engine adds the model `NoCms::Seo::Info` that can store a title, a description, whether the object should be excluded from the sitemap and noindex, nofollow information.

To attach this `NoCms::Seo::Info` model to a model of your own you just have to include a concern in your model

```ruby
  include NoCms::Seo::Concerns::ModelWithSeo
```

### Controllers and concern

As will be explained in the following section, nocms-seo uses Presenter classes to manage how SEO information is extracted for the current request.

This engine also includes a concern for our controllers with the base case for loading SEO information. This concerns adds a `before_action` called `set_seo_info` that loads the most basic presenter.

You can include it in your controller using:

```ruby
include NoCms::Seo::Concerns::ControllerWithSeo
```

And you can overwrite the basic behaviour overwriting the method `set_seo_info`.

### Presenters

SEO Information may require more logic than just storing some information in a database. In fact, you may not be interested on storing a new title in your database. Maybe you only want that the title for your product page is your site name following your product title.

Normally, this kind of logic is put on the model with a `seo_title` method or in the view (and we know views should have as little logic as possible). In this gem we use an idea extracted from [RefineryCMS][http://refinerycms.com/], the presenters.

Presenters are classes that handle the SEO logic (using site names, truncating descriptions...) and are called from the view. This way both model and view are free from SEO stuff.

NoCMS SEO comes with two kinds of presenters (Base and SeoInfo, explained later in this document) but any class that define the following methods is compatible with the Helpers where this presenters are used:

  - `title`
  - `description`
  - `canonical_url host`
  - `no_index`
  - `no_follow`


#### Base Presenter

It's a very basic presenter that uses translation files to display SEO information. You can customize this SEO information by copying the following keys to your locale file:

```
en: # Replace with your locale or omit it if you already have the locale file created
  no_cms:
    seo:
      default_description: ""
      default_title: ""
```

It's used by the basic behaviour in the `NoCms::Seo::Concerns::ControllerWithSeo` concern.

#### SeoInfo Presenter

It's a presenter that extracts SEO information from a model that has the `NoCms::Seo::Concerns::ModelWithSeo` concern attached. If the SEO information is blank (i.e. It has not customized on the back) it gives you the chance to set a default one.

As every model can have different rules for displaying the default SEO information (e.g: A product's SEO title may be `"Buy #{product.title}"`) this presenter is usually inherited by a class that overwrite or decorate the regular behaviour.

An example could be the following presenter for a product object:

```ruby
module NoCms::Seo::Presenters

  class ProductsPresenter < SeoInfoPresenter

    alias_method :product, :object

    def canonical_url(host)
      MyRailsApp::Application.routes.url_helpers.product_url product, host: host
    end

    def default_title
      I18n.t('no_cms.seo.products.product.title', name: product.name, price: product.price) # e.g Buy product.name for just product.price €!!
    end

  end

end
```

### Helpers

Helpers are used from views to set SEO tags. Available helpers are:

  - title_tag: Writes the <title> tag
  - meta_description_tag: Writes the <meta name="description"> tag
  - canonical_url_tag: Writes the <link rel="canonical"> tag
  - robots_tag: Writes the <meta name"robots"> tag.

The first three helpers can receive an string, in which case the corresponding tag will have that text as a value. This is commonly used in combination with a yield, so you can modify the title, description or canonical from any view with a content_for:

```
  <%= raw title_tag yield(:seo_title) %>
  <%= raw meta_description_tag yield(:seo_meta_description) %>
  <%= raw canonical_url_tag yield(:seo_canonical_url) %>
```

The `robots_tag` helper can receive a hash with the keys `no_index` and `no_follow` set.

All this helpers rely on the existence of a SeoPresenter in the `@seo_info` variable if they don't receive a string or hash.

The helper must be included in the `ApplicationController` with the following line:

```ruby
  helper NoCms::Seo::SeoHelper
```

Development
------------

```
$ git clone https://github.com/simplelogica/nocms-seo.git
$ bundle install
$ rake

```

Then tests should run (and pass, I hope...).

Now we can run the dummy app console or server:

```
$ rake db:migrate
$ cd spec/dummy
spec/dummy$ rails console
```
