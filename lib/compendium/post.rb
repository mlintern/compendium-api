require 'rubygems'
require 'httparty'

class Compendium
  include HTTParty
  def posts(page, search = nil, status = nil)
    query = { :Count => 100, :Page => page }
    unless status.nil?
      query[:Status] = status.to_json
    end
    unless search.nil?
      query[:SearchTerms] = search
    end
    response = Compendium.get('/app/posts', :basic_auth => @auth, :query => query )
  end

  def post(postid)
    response = Compendium.get('/app/post/' + postid, :basic_auth => @auth )
  end
end