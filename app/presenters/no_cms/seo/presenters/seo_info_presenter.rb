module NoCms::Seo::Presenters
  class SeoInfoPresenter < BasePresenter

    attr_accessor :object

    def initialize object
      self.object = object
    end

    def title
      self.object.seo_info.title.blank? ? super : self.object.seo_info.title
    end

    def description
      self.object.seo_info.description.blank? ? super : self.object.seo_info.description
    end

    def no_index?
      self.object.seo_info.no_index?
    end

    def no_follow?
      self.object.seo_info.no_follow?
    end

  end
end
