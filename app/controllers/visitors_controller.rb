class VisitorsController < ApplicationController
  layout 'application'
  skip_before_filter :authenticate_user!

  def index
    if params[:url]
      @site = get_site(params[:url])
      redirect_to @site.present? ? "/s/#{@site.short_title}" : '/'
    end 
  end

  def show
    if params[:url]
      @site = get_site(params[:url])
      redirect_to @site.present? ? "/s/#{@site.short_title}" : '/'
    else
      @site = Site.find_by(short_title: params[:short_title])
    end
  end
end
