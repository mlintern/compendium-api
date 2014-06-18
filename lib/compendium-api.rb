require 'rubygems'
require 'httparty'

class Compendium
  include HTTParty
  base_uri 'https://app.compendium.com'
  format :json
  headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"

  def initialize(u, p, b)
    @auth = {:username => u, :password => p}
    self.class.base_uri b
  end

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

  def required_params
    @auth
  end
end