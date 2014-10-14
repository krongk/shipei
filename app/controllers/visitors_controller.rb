class VisitorsController < ApplicationController
  layout 'application'
  skip_before_filter :authenticate_user!

  def index
    if params[:url] && @site = get_site(params[:url])
      redirect_to  "/s/#{@site.short_title}" and return
    end
    @top_ten_sites = Site.order("id asc").limit(18)
    @site_count = Site.count
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

end
