require 'capybara'
require 'capybara/poltergeist'

class RecapsController < ApplicationController
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	def index
		visit "http://www.football-bible.com/soccer-glossary/letterb.html"

		@posts = all("h3").map do |post|
			{
				title: post.text
			}
		end

		@definitions = all("h3 + p").map do |definition|
			{
				body: definition.text
			}
		end

		@key_vals = {}
		# push title and body to new object and use object to display definitions and terms
	end
end
