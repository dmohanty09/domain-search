require 'net/http'
require 'whois'

class Crawler
  
  def sanitize_strings(name_list)
    name_list.map{|n|n.downcase.gsub(/[^a-z0-9]/i, '')} - [""]
  end
  
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
    sanitize_strings(@name_list).map{|name|name + ".com"}
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
  
  def who_is_lookup(domain_name)
    Whois.whois(domain_name).properties
  end
end

