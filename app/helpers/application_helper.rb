module ApplicationHelper

  def get_site_path(site)
    "/s/#{site.short_title}"
  end
end
