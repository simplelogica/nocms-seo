module NoCms::Seo::Presenters
  class SeoInfoPresenter < BasePresenter

    attr_accessor :seo_info

    def initialize object, kind = nil
      self.seo_info = object.seo_infos.where(kind: kind).last
    end

    def title
      seo_info.title.blank? ? super : seo_info.title
    end

    def description
      seo_info.description.blank? ? super : seo_info.description
    end

    def default_description
      base_presenter.description
    end

    def no_index?
      seo_info.no_index?
    end

    def no_follow?
      seo_info.no_follow?
    end

  end
end
