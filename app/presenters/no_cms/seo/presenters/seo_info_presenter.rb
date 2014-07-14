module NoCms::Seo::Presenters
  class SeoInfoPresenter

    attr_accessor :object, :base_presenter

    def initialize object
      self.object = object
      self.base_presenter = NoCms::Seo::Presenters::BasePresenter.new
    end

    def title
      self.object.seo_info.title.blank? ? default_title : self.object.seo_info.title
    end

    def default_title
      base_presenter.title
    end

    def description
      self.object.seo_info.description.blank? ? default_description : self.object.seo_info.description
    end

    def default_description
      base_presenter.description
    end

    def no_index?
      default_no_index? || self.object.seo_info.no_index?
    end

    def default_no_index?
      false
    end

    def no_follow?
      default_no_follow? || self.object.seo_info.no_follow?
    end

    def default_no_follow?
      false
    end

  end
end
