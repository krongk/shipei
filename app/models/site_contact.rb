class SiteContact < ActiveRecord::Base
  belongs_to :site

  attr_accessor :url
end
