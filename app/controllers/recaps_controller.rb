require 'capybara'
require 'capybara/poltergeist'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

class RecapsController < ApplicationController
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	def index
		# set base url
		soccerlens_url = "http://soccerlens.com/"

		soccerlens_data = Nokogiri::HTML(open(soccerlens_url))

		# article root node is .articleindex

		# article title
		soccerlens_data.at_css(".articleindex .postWrapper .postTitle a").text

		# article link
		soccerlens_data.at_css(".articleindex .postWrapper .postTitle a").attr("href")

		# article excerpt
		soccerlens_data.at_css(".articleindex .postWrapper .article-excerpt").text.strip
	end

end
