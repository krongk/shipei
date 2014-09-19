class Site < ActiveRecord::Base
  before_create :create_unique_short_title

  validates :domain, presence: true
 
  private
    def create_unique_short_title
      begin
        self.short_title = self.domain.gsub(/\./, '-')
        self.short_title = SecureRandom.hex(2) if self.class.exists?(:short_title => short_title)
      end while self.class.exists?(:short_title => short_title)
    end
end
