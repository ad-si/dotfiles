#!/usr/bin/env ruby

# Originally written by http://redartisan.com/tags/csv
# Added and minor changes by Gavin Laking
# Rewritten by Andrew Bennett for Ruby 1.9
# 
# Usage: ruby csv_to_fixture.rb file.csv [--json]
#
# "id","name","mime_type","extensions","icon_url"
# "1","unknown","unknown/unknown","||","/images/icon/file_unknown.gif"
# "2","image/tiff","image/tiff","|tiff|tif|","/images/icon/blank.png"
#
# if you want to remove the id: "number" line from the resulting YAML file
# do a find and replace for: ^( id: \"\d*\"\n) in Textmate

require 'csv'
require 'json'
require 'yaml'

input    = ARGV.shift
key_name = ARGV.shift

is_file = (input.nil? ? false : File.exist?(input))
file = is_file ? input : STDIN

doc = is_file ? CSV.read(file) : CSV.parse(file.read)
fields = doc.shift
records = Hash.new
doc.each do |row|
  key = nil
  record = Hash.new
  fields.each_with_index do |field, j|
    if field == key_name
      key = row[j]
      next
    end
    record[field] = row[j]
  end
  records[key] = record
end

flag = ARGV.shift unless input.nil?
flag ||= input || '--yaml'

case flag
when '--json' then
  puts records.to_json
else
  puts records.to_yaml
end
