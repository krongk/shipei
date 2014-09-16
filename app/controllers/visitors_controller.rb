class VisitorsController < ApplicationController
  layout 'application'
  skip_before_filter :authenticate_user!

  def index
    if params[:url]
      domain = begin
        URI.parse(params[:url]).hostname
      rescue
      end
      return if domain.nil?
      @site = Site.find_or_create_by(domain: domain)
      redirect_to get_site_path(@site)
    end
  end

  def show
    @site = Site.find_by(short_title: params[:short_title])
    @devices = Device.where(is_processed: 'y').order("id ASC").all
  end
end
