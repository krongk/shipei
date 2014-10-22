#encoding: utf-8
# to extact title, meta keywords from site domain
# http://nokogiri.org/
require 'nokogiri'
require 'open-uri'

require 'forager/site_common'

class SiteProcessWorker
  include Sidekiq::Worker
  
  def perform(site_id)
    Forager::SiteCommon.crawl(site_id)
  end
end
