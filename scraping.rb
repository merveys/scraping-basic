require 'open-uri'
require 'nokogiri'
require 'csv'

html = open("https://en.wikipedia.org/wiki/Jim_Carrey")
doc = Nokogiri::HTML(html)

data_arr = []
description = doc.css("p").text.split("\n").find{|e| e.length > 0}

data_arr.push([description])

CSV.open('data.csv', "w") do |csv|
  csv << data_arr
end
