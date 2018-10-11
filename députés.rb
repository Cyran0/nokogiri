require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'

def deputes
    doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
    hash = {}
    doc.xpath('//ul/li/a').each do |v|
        if v.text.include?("M.") | v.text.include?("Mme")
            a = v.text.split(" ")[1]
            b = v.text.split(/\.?\s+/, 3)[2].gsub(/ /, '')
            c = a.downcase + "." + b.downcase + "@assemblee-nationale.fr"
            hash[v.text] = {:first_name => a, :last_name => b, :email => c}
        end
    end
    pp hash
end
deputes