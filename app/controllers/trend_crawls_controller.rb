require 'crawler'

class TrendCrawlsController < ApplicationController
  
  def index
    crawler = Crawler.new
    #@domain_names = crawler.query_google
    @domain_names = TrendCrawlSite.all
    if params[:search_query] == ""
      @fresh_names = crawler.query_google.to_json
    elsif !params[:search_query].nil?
      @fresh_names = [].to_json
    else
      @fresh_names = [].to_json
    end
  end
  
  def show
    domain_name_suffixed = params[:id] + ".com"
    site_in_db = TrendCrawlSite.find_by(domain: domain_name_suffixed)
    
    if site_in_db.nil?
      puts "not in db, crawling..."
      crawler = Crawler.new
      domain = crawler.who_is_lookup(domain_name_suffixed)
      domain[:registrar] = (domain[:registrar]||{}).to_h
      domain[:registrant_contacts] = (domain[:registrant_contacts]||[]).map{|r|r.to_h}
      domain[:admin_contacts] = (domain[:admin_contacts]||[]).map{|r|r.to_h}
      domain[:technical_contacts] = (domain[:technical_contacts]||[]).map{|r|r.to_h}
      domain[:nameservers] = (domain[:nameservers]||[]).map{|r|r.to_h}
      TrendCrawlSite.new(domain.except(:disclaimer)).save
      puts "saving..."
    else
      puts "already in db, no need to crawl"
      domain = site_in_db
    end
    
    render json: domain
  end
  
end
