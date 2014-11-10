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

To attach this `NoCms::Seo::Info` model you just have to include a concern in your model

```ruby
  include NoCms::Seo::Concerns::ModelWithSeo
```
