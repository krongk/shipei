#this script used to crawl site title/keywords/description
#used in: 
# 1.  workers/site_process_worker.rb
#
module Forager
  module SiteCommon
    SPECIAL_SYMB = '-|_|\||\(|,|\.|\+|::|，|、|。|——|－|一|】|·'

    def self.crawl(site_id)
      flag = 'y'
      site = Site.find(site_id)
      puts "start processing site: #{site.domain}"
      url = "http://#{site.domain}"
      begin
        doc = Nokogiri::HTML(open(url))
      rescue => ex
        flag = ex.message
      end
      return if doc.nil?

      begin
        #1.1 get title
        site.title = doc.at('title').text
        unless site.title.blank?
          site.title = site.title.sub(/\s*(#{SPECIAL_SYMB}).*$/, '')
        end
        #1.2. reverse
        #首页 - 微酷点米|码农拾忆
        if site.title == "首页"
          site.title = doc.at('title').text
          site.title = site.title.sub(/^.*\s*(#{SPECIAL_SYMB})/, '')
        end
        #1.3 remove unusual
        site.title = nil if site.title =~ /Index of/i

        #2. get keywords
        site.keywords = doc.at('meta[name=keywords]').attr('content') if doc.at('meta[name=keywords]')
        if site.keywords.blank?
          site.keywords = doc.at("h1").text if doc.at("h1")
          if site.keywords.blank?
            site.keywords = doc.at("h2").text if doc.at("h2")
          end
        end
        #4. get description
        site.description = doc.at('meta[name=description]').attr('content') if doc.at('meta[name=description]')
      rescue => ex
        flag += ' - ' + ex.message
      end

      site.is_processed = flag
      site.save!
      puts "done for process site: #{site.id} - #{flag}"
    end
  end
end