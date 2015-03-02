require 'net/http'
require 'whois'

class Crawler
  #only accept alphanumeric or numeric characters
  def sanitize_strings(name_list)
    name_list.map{|n|n.downcase.gsub(/[^a-z0-9]/i, '')} - [""]
  end
  
  #domain name suggestions for blank query
  def query_google
    postData = Net::HTTP.post_form(URI.parse('http://www.google.com/trends/hottrends/hotItems'), {"ajax"=>"1","pn"=>"p1","htv"=>"m"})
    parse_trends(JSON.parse(postData.body))
  end
  
  def parse_trends(trends_hash)
    @name_list = []
    trends_hash["weeksList"].each do |week|
      week["daysList"].each do |day|
        if !day["data"].nil?
          parse_trend(day["data"]["trend"])
        end
      end
    end
    sanitize_strings(@name_list)
  end
  
  def parse_trend(trend)
    @name_list << trend["title"]
    #parse_relatedSearches(trend["relatedSearchesList"])
  end
  
  def parse_relatedSearches(relatedSearchesList)
    relatedSearchesList.each do |search|
       @name_list << search
     end
  end

  #domain name suggestions for specified search_query
  def query_suggestions(search_query)
    uri = URI('http://suggestqueries.google.com/complete/search')
    params = {:client => 'firefox', :q => "#{search_query}"}
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    @name_list = JSON.parse(res.body)[1]
    sanitize_strings(@name_list)
  end
  
  def who_is_lookup(domain_name)
    Whois.whois(domain_name).properties
  end
end

