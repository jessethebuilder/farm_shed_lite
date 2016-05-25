require 'rest-client'
require 'json'

module RestHelper
  def url_to_json(url, method: :get, params: {}, encode: true)
    url = encode_url(url) if encode
    json = RestClient.send(method, url, params)
    
    json
    # JSON.parse(json) if json
    # RestClient.post(url, params)  
  end
  
  def encode_url(url)
    URI.encode(url)
  end  
end  