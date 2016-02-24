module NoCms::Seo::Presenters
  class SeoInfoPresenter < BasePresenter

    attr_accessor :seo_info

    def initialize object, kind = nil
      self.seo_info = object.seo_infos.where(kind: kind).last
    end

    def title
      (seo_info && !seo_info.title.blank?) ? seo_info.title : super
    end

    def description
      (seo_info && !seo_info.description.blank?) ? seo_info.description : super
    end

    def no_index?
      seo_info && seo_info.no_index?
    end

    def no_follow?
      seo_info && seo_info.no_follow?
    end

  end
end
