class VisitorsController < ApplicationController
  layout 'application'
  skip_before_filter :authenticate_user!

  def index
    if params[:url] && @site = get_site(params[:url])
      redirect_to  "/s/#{@site.short_title}" and return
    end
    @top_ten_sites = Site.limit(18)
  end

  def show
    if params[:url] 
      if @site = get_site(params[:url])
        redirect_to "/s/#{@site.short_title}" and return
      else
        redirect_to "/" and return
      end
    else
      @site = Site.find_by(short_title: params[:short_title])
    end
  end

  private
  def get_site(url)
    domain = URI.parse(url).hostname
    return nil if domain.nil?
    site = Site.find_by(domain: domain)
    return site unless site.nil?

    site = Site.new
    site.domain = domain
    site.save!
    site.reload
    #send notice to admin
    if Rails.env == 'production'
      SiteProcessWorker.perform_async(site.id)
    end
    return site
  end
end
