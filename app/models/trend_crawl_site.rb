class TrendCrawlSite < ActiveRecord::Base
  serialize :registrar
  serialize :registrant_contacts
  serialize :admin_contacts
  serialize :technical_contacts
  serialize :nameservers
  validates_uniqueness_of :domain
end
