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
      t.text :registrar
      t.text :registrant_contacts
      t.text :admin_contacts
      t.text :technical_contacts
      t.text :nameservers

      t.timestamps null: false
    end
  end
end
