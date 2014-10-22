#encoding: utf-8
# to extact title, meta keywords from site domain
# http://nokogiri.org/
require 'nokogiri'
require 'open-uri'

class SiteProcessWorker
  include Sidekiq::Worker

  def perform(site_id)
    flag = 'y'
    site = Site.find(site_id)
    puts "start processing site: #{site_id}"
    url = "http://#{site.domain}"
    begin
      doc = Nokogiri::HTML(open(url))
    rescue => ex
      flag = ex.message
    end
    return if doc.nil?

    begin
      site.title = doc.at('title').text
      unless site.title.blank?
        site.title = site.title.sub(/\s*(-|_|\||,|\.|\+|，|、|。|——|·).*$/, '')
      end
      site.keywords = doc.at('meta[name=keywords]').attr('content')
      site.description = doc.at('meta[name=description]').attr('content')
    rescue => ex
      flag += ' - ' + ex.message
    end

    site.is_processed = flag
    site.save!
    puts "done for process site: #{site.id} - #{flag}"
  end
end
