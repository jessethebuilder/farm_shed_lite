require 'rest-client'
require 'json'

module RestHelper
  def url_to_json(url, method: :get, params: {}, encode: true)
    url = encode_url(url) if encode
    JSON.parse(RestClient.send(method, url, params))
    # RestClient.post(url, params)  
  end
  
   # '1405477876366613|bf5306d4d7b7fe4346815f81475acc3c'
  
  def encode_url(url)
    URI.encode(url)
  end  
end  