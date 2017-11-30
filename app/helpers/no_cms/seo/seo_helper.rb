module NoCms::Seo::SeoHelper

  def canonical_url_tag canonical_url = ''
    canonical_url = canonical_url.blank? ? @seo_info.canonical_url(request.host_with_port) : canonical_url
    tag("link", rel: 'canonical', href: canonical_url) unless canonical_url.blank?
  end

  def meta_description_tag default_description = ''
    description = default_description.blank? ? @seo_info.description : default_description
    tag("meta", name: 'description', content: description) unless description.blank?
  end

  def title_tag default_title = ''
    title = default_title.blank? ? @seo_info.title : default_title
    content_tag :title, title unless title.blank?
  end

  def robots_tag options = {}
    options ||= {}
    no_index = options[:no_index].nil? ? @seo_info.no_index? : options[:no_index]
    no_follow = options[:no_follow].nil? ? @seo_info.no_follow? : options[:no_follow]
    content = no_index ? "noindex" : "index"
    content += ', '
    content += no_follow ? "nofollow" : "follow"

    tag("meta", name: 'robots', content: content)
  end

end
