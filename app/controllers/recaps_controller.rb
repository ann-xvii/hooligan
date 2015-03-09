require 'capybara'
require 'capybara/poltergeist'

class RecapsController < ApplicationController
	include Capybara::DSL
	Capybara.default_driver = :poltergeist

	def index
		visit "http://cleveland.cbslocal.com/2014/06/11/world-cup-for-dummies-soccer-lingo-you-need-to-know/"

		@posts = all("p").map do |post|
			{
				title: post.text

			}
		end
	end
end
