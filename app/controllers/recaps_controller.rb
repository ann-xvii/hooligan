require 'capybara'
require 'capybara/poltergeist'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

class RecapsController < ApplicationController
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	def index
		mechanize = Mechanize.new
		soccerlens_page = mechanize.get("http://soccerlens.com/")
		# mechanize.get("http://soccerlens.com/").search(".articleindex")
		
		# array of articles
		@soccer_article_container = []

		mechanize.page.parser.css(".articleindex").each do |article|
			article_unit = {
				title: "",
				link: "",
				date: "",
				author_link: "",
				excerpt: "",
				image: "",
				escaped_title: ""
			}
			text = article.at_css(".postWrapper .postTitle").text
			puts text

			article_unit[:title] = article.at_css(".postWrapper .postTitle").text
			article_unit[:link] = article.at_css(".postWrapper .postTitle a").attr("href")
			article_unit[:date] = article.at_css(".postWrapper .articlemeta").text
			article_unit[:author_link] = article.at_css(".postWrapper .articlemeta a").attr("href")
			article_unit[:excerpt] = article.at_css(".postWrapper .article-excerpt p").text.strip
			article_unit[:image] = article.at_css(".postWrapper .article-excerpt .featured-image img").attr("src")
			
			# format image title, remove spaces
			# save formatted title string

			temp_title = article_unit[:title].gsub(/[^0-9a-z ]/i, '')

			article_unit[:escaped_title] = CGI::escape(temp_title)
			#mechanize.get(article_unit[:image]).save "app/assets/images/#{article_unit[:escaped_title]}.jpg"

			@soccer_article_container.push(article_unit)
		end

		### HIERARCHY
		### .articleindex .postWrapper

		# postTitle comes first, # the title is a link
		# @ludicrous_title = mechanize.page.parser.at_css(".articleindex .postWrapper .postTitle").text
		# @ludicrous_link = mechanize.page.parser.at_css('.articleindex .postWrapper .postTitle a').attr("href")
		# link = mechanize.page.parser.at_css('.articleindex .postWrapper .postTitle a').attr("href")
		# # get article date and author
		# @ludicrous_date = mechanize.page.parser.at_css(".articleindex .postWrapper .articlemeta").text
		# @ludicrous_author_link = mechanize.page.parser.css(".articleindex .postWrapper .articlemeta a")[0].attr("href")

		# # get article excerpt, get image
		# @ludicrous_excerpt = mechanize.page.parser.at_css(".articleindex .postWrapper .article-excerpt p").text.strip
		# @ludicrous_image = mechanize.page.parser.at_css(".articleindex .postWrapper .article-excerpt .featured-image img").attr("src")

		# @full_article_link = soccerlens_page.link_with(text: "Read More")
		# new_link = soccerlens_page.link_with(href: link)
		# soccerlens_page = new_link.click
		# @full_text = mechanize.page.parser.css("#single-content p").text.strip
		articles_container = Array.new

		articles_container 

		
	end

end
