module NoCms::Seo::Concerns::ControllerWithSeo
  extend ActiveSupport::Concern

  included do
    helper NoCms::Seo::SeoHelper

    before_action :set_seo_info

    def set_seo_info
      @seo_info = NoCms::Seo::Presenters::BasePresenter.new
    end
  end

end
