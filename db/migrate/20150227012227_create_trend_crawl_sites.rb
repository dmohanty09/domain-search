class CreateTrendCrawlSites < ActiveRecord::Migration
  def change
    create_table :trend_crawl_sites do |t|
      t.string :domain
      t.string :domain_id
      t.string :status
      t.boolean :available?
      t.boolean :registered?
      t.datetime :created_on
      t.datetime :updated_on
      t.datetime :expires_on
      t.string :registrar
      t.string :registrant_contacts
      t.string :admin_contacts
      t.string :technical_contacts
      t.string :nameservers

      t.timestamps null: false
    end
  end
end
