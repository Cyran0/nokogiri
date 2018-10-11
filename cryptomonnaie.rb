require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'

def method
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

  crypto = []
  price = []

  doc.xpath('//td[2]/a').each do |v|
    crypto << v.text
  end

  doc.xpath('//td[5]/a').each do |v|
    price << v.text
  end

  hash1 = Hash[crypto.zip(price)]

pp hash1
end

method