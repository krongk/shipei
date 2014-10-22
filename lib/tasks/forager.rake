require 'forager/site_common'

namespace :forager do
  desc "Crawl site title/keywords/description"
  task site_common: :environment do
    Site.where("is_processed <> 'y'").find_each do |site|
      Forager::SiteCommon.crawl(site.id)
    end
  end

  desc "TODO"
  task site_contact: :environment do
  end

end
