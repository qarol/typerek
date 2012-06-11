# encoding: utf-8

require 'rubygems'
require 'mechanize'
require 'uri'

#$KCODE = 'UTF8'

class Parser

	attr_accessor :doc

	def initialize url = "http://www.bet-at-home.com/oddxml.aspx?lang=PL&extended=true"
		agent = Mechanize.new {|a| 
			#a.follow_meta_refresh = :anywhere
			#a.redirect_ok = false
		}
		page = agent.get url
		if page.body[0..250] =~ /interval/i
			puts "GOT RESPONSE FROM #{URI.parse(url).host}:\n\t" + page.body 
			exit
		end
		@doc = Nokogiri::XML(page.body)
	end

	def run
		self.process [['Polska', 'Rosja']]
	end

	def process matches
		result = {}
		matches.each{|teams|
			#puts teams.inspect
			odds = get_match_odds teams
			result[teams] = odds
			#puts odds.inspect
		}
		result
	end

	def get_match_odds teams
		res3W = @doc.xpath("//*[Sport='Piłka nożna' and Tournament='EURO - 2012' and OddsType='3W' and Date='#{teams[2]}']//*[HomeTeam='#{teams[0]}' and AwayTeam='#{teams[1]}']")
		resDC = @doc.xpath("//*[Sport='Piłka nożna' and Tournament='EURO - 2012' and OddsType='DC' and Date='#{teams[2]}']//*[HomeTeam='#{teams[0]}' and AwayTeam='#{teams[1]}']")
		#puts res3W.inspect
		#puts resDC.inspect
		odds = {}
		odds['_1'] = res3W.xpath(".//HomeOdds").text
		odds['_x'] = res3W.xpath(".//DrawOdds").text
		odds['_2'] = res3W.xpath(".//AwayOdds").text
		odds['_1x'] = resDC.xpath(".//Odds1X").text
		odds['_x2'] = resDC.xpath(".//OddsX2").text
		odds['_12'] = resDC.xpath(".//Odds12").text
		odds
	end
	
end
