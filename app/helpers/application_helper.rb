module ApplicationHelper
  SITE_KEYWORDS = %w{
    摩适配
    手机网站适配
    电脑网站转手机网站
    响应式网站
    适配微网站
  }.join(', ')
  
  def title(page_title)
    content_for(:title){ page_title}
    return page_title
  end
  def meta_keywords(meta_keywords)
    content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
    content_for(:meta_description){ meta_description}
  end
  
  def get_site(url)
    domain = begin
      URI.parse(url).hostname
    rescue
    end
    return nil if domain.nil?
    site = Site.find_by(domain: domain)
    return site if site.present?

    site = Site.create(domain: domain)
    #send notice to admin
    if Rails.env == 'production'
      SiteProcessWorker.perform_async(site.id)
    end
    return site
  end
end
