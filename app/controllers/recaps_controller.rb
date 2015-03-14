require 'capybara'
require 'capybara/poltergeist'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

class RecapsController < ApplicationController
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	def index
		# add placeholder for current user to comment on the games
		if logged_in?
			@post = current_user.posts.build if logged_in?
			# @feed_items = current_user.feed.order_by(created_at: :desc)
			@all_posts = Post.all.order_by(created_at: :desc)
		end

		# initialize mechanize
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

	def analysis

		article = Struct.new(:title, :body, :byline, :time, :link)
		mechanize = Mechanize.new
		# page = agent.get("http://www.theguardian.com/football")

		# mechanize.page.parser.at_css('.fc-container__inner .fc-container__header .fc-container__header__title span').text.strip

		# mechanize.page.parser.at(".fc-container__inner .fc-container__header .fc-container__header__title span:contains('in depth')").text.strip
		mechanize.get("http://www.theguardian.com/football/blog/2015/mar/14/its-time-to-rediscover-our-love-of-headers")

		@current_article = {
			title: "",
			body: "",
			byline: "",
			time: "",
			link: "" 
		}
		@current_article[:title] = mechanize.page.parser.css(".content__headline").text.strip
		@current_article[:body] = mechanize.page.parser.css(".content__article-body p").text.strip
		@current_article[:byline] = mechanize.page.parser.css(".byline").text.strip
		@current_article[:time] = mechanize.page.parser.css(".content__dateline-wpd").text.strip
		@current_article[:link] = "http://www.theguardian.com/football/blog/2015/mar/14/its-time-to-rediscover-our-love-of-headers"


	end

end
