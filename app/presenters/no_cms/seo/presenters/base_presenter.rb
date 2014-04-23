class NoCms::Seo::Presenters::BasePresenter

  def title
    I18n.t('no_cms.seo.default_title')
  end

  def description
    I18n.t('no_cms.seo.default_description')
  end

  def canonical_url host
    ""
  end

end
