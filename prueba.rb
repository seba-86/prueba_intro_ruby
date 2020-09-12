require 'uri'
require 'net/http'
require 'json'
require 'openssl'

# def request(adress)
#     url = URI(adress)
#     http = Net::HTTP.new(url.host, url.port)
#     request = Net::HTTP::Get.new(url)
#     http.use_ssl =true
#     http.verify_mode = OpenSSL::SSL::VERIFY_PEER
#     response = http.request(request)
#     return JSON.parse(response.read_body)

# end



# data = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a')


def request(url, key)
    adress = url + key
    url = URI(adress)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl =true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(request)
    return JSON.parse(response.read_body)
    
end

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","uiNznqVzPBBnJls8bRu7VS6qodPlqwFtH0GuJw9a")

# print data.class
    new_data=[]
    data["photos"].each do |data| 
    new_data << data["img_src"]
    end 

def buid_web_page(new_data)

    ul = ''
    new_data.each do |new_data|
    ul += "\s <li><img src='#{new_data}'></li>\n"

    end
    puts ("</ul>\n")
    return ul 
end