module NoCms::Seo::Presenters
  class SeoInfoPresenter

    attr_accessor :seo_info, :base_presenter

    def initialize object, kind = nil
      self.seo_info = object.seo_infos.where(kind: kind).last
      self.base_presenter = NoCms::Seo::Presenters::BasePresenter.new
    end

    def title
      seo_info.title.blank? ? default_title : seo_info.title
    end

    def default_title
      base_presenter.title
    end

    def description
      seo_info.description.blank? ? default_description : seo_info.description
    end

    def default_description
      base_presenter.description
    end

    def no_index?
      default_no_index? || seo_info.no_index?
    end

    def default_no_index?
      false
    end

    def no_follow?
      default_no_follow? || seo_info.no_follow?
    end

    def default_no_follow?
      false
    end

  end
end
