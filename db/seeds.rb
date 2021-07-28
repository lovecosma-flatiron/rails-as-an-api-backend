# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

    class Api

        URL = ""
        def initialize(url)
        @url = url
        # @card_objects = []
        end

        def get_response_body
        @uri = URI.parse(@url)
        @response = Net::HTTP.get_response(@uri)
        @response.body
        end

        def parse_json
        @programs = JSON.parse(self.get_response_body)
        # binding.pry
        @programs["data"][0]["parks"].each do |park|
            Park.create(park)
        end 
        end
end

Api.new("https://developer.nps.gov/api/v1/topics/parks?id=28AEAE85-9DDA-45B6-981B-1CFCDCC61E14&id=&api_key=VocVsC82hxN0rPyD0Qgjw2RHT6QSaQaxoNeWsBfm").parse_json

