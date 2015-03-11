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
		@posts = soccerlens_data.at_css(".articleindex .postWrapper .article-excerpt").text.strip



		mechanize = Mechanize.new
		soccerlens_page = mechanize.get("http://soccerlens.com/")
		# mechanize.get("http://soccerlens.com/").search(".articleindex")
		# soccerlens_page.link_with(text: "\nRead More →")

		### HIERARCHY
		### .articleindex .postWrapper

		# postTitle comes first, # the title is a link
		@ludicrous_title = mechanize.page.parser.at_css(".articleindex .postWrapper .postTitle").text
		@ludicrous_link = mechanize.page.parser.at_css('.articleindex .postWrapper .postTitle a').attr("href")
		link = mechanize.page.parser.at_css('.articleindex .postWrapper .postTitle a').attr("href")
		# get article date and author
		@ludicrous_date = mechanize.page.parser.at_css(".articleindex .postWrapper .articlemeta").text
		@ludicrous_author_link = mechanize.page.parser.css(".articleindex .postWrapper .articlemeta a")[0].attr("href")

		# get article excerpt, get image
		@ludicrous_excerpt = mechanize.page.parser.at_css(".articleindex .postWrapper .article-excerpt p").text.strip
		@ludicrous_image = mechanize.page.parser.at_css(".articleindex .postWrapper .article-excerpt .featured-image img").attr("src")

		# @full_article_link = soccerlens_page.link_with(text: "Read More")
		# new_link = soccerlens_page.link_with(href: link)
		# soccerlens_page = new_link.click
		# @full_text = mechanize.page.parser.css("#single-content p").text.strip
		articles_container = Array.new

		articles_container 

		mechanize.page.parser.css(".articleindex").each do |article|
			text = article.at_css(".postWrapper .postTitle").text
			puts text
		end
	end

end
