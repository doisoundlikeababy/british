require 'net/http'
require 'catpix'
require 'json'

puts "how many british people do you want to print"

url = URI('https://randomuser.me/api/?nat=gb%27')
times = gets.chomp.to_i

times.times {
  person = Net::HTTP.get url
  results = JSON.parse person

  Catpix::print_image results["results"][0]["picture"]["thumbnail"],
    :limit_x => 0,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg_fill => false,
    :resolution => "high"
}
