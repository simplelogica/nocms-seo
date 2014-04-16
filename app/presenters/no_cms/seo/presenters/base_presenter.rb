class NoCms::Seo::Presenters::BasePresenter

  def title
    NoCms::Seo.default_title
  end

  def description
    NoCms::Seo.default_description
  end

  def canonical_url
    ""
  end

end
