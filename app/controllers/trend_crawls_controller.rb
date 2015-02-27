require 'crawler'

class TrendCrawlsController < ApplicationController
  
  def index
    crawler = Crawler.new
    @domain_names = crawler.query_google
  end
  
  def show
    crawler = Crawler.new
    domain = crawler.who_is_lookup(params[:id] + ".com")
    domain[:registrar] = (domain[:registrar]||{}).to_h
    domain[:registrant_contacts] = (domain[:registrant_contacts]||[]).map{|r|r.to_h}
    domain[:admin_contacts] = (domain[:admin_contacts]||[]).map{|r|r.to_h}
    domain[:technical_contacts] = (domain[:technical_contacts]||[]).map{|r|r.to_h}
    render json: domain
  end
  
end
