require 'open-uri'
require 'nokogiri'



doc = Nokogiri::HTML(URI.open('https://muscledeli.co.jp/menu/'))

doc.css('h3').each do |title|
  puts title.content
end

doc.css('tr[1] td[2]').each do |calorie|
  puts calorie.content.delete("^0-9").to_i
end

doc.css('tr[2] td[2]').each do |protein|
  puts protein.content.delete("g").to_f
end

doc.css('tr[3] td[2]').each do |fat|
  puts fat.content.delete("g").to_f
end

doc.css('tr[4] td[2]').each do |carb|
  puts carb.content.delete("g").to_f
end