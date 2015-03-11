require 'capybara'
require 'capybara/poltergeist'

class RecapsController < ApplicationController
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	def index
		visit "http://www.football-bible.com/soccer-glossary/letterb.html"

		definitions = []
		# @posts = all("#glossarycontent").map do |post|
		# 	{
		# 		title: post.find("h3").text,
		# 		body: post.find("p").text
		# 	}
		# end

		# @definitions = all("h3 + p").map do |definition|
		# 	{
		# 		body: definition.text
		# 	}
		# end
		@posts = all("#glossarycontent")

		


	end
end
