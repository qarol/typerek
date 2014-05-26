# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create(:email => "admin@example.com", :password => "password", :password_confirmation => "password", :username => "admin")

Match.create(:teamA => "Polska", :teamB => "Grecja", :start => "2012-06-08 18:00")
Match.create(:teamA => "Rosja", :teamB => "Czechy", :start => "2012-06-08 20:45")

Match.create(:teamA => "Holandia", :teamB => "Dania", :start => "2012-06-09 18:00")
Match.create(:teamA => "Niemcy", :teamB => "Portugalia", :start => "2012-06-09 20:45")

Match.create(:teamA => "Hiszpania", :teamB => "Włochy", :start => "2012-06-10 18:00")
Match.create(:teamA => "Irlandia", :teamB => "Chorwacja", :start => "2012-06-10 20:45")

Match.create(:teamA => "Francja", :teamB => "Anglia", :start => "2012-06-11 18:00")
Match.create(:teamA => "Ukraina", :teamB => "Szwecja", :start => "2012-06-11 20:45")

Match.create(:teamA => "Grecja", :teamB => "Czechy", :start => "2012-06-12 18:00")
Match.create(:teamA => "Polska", :teamB => "Rosja", :start => "2012-06-12 20:45")

Match.create(:teamA => "Dania", :teamB => "Portugalia", :start => "2012-06-13 18:00")
Match.create(:teamA => "Holandia", :teamB => "Niemcy", :start => "2012-06-13 20:45")

Match.create(:teamA => "Włochy", :teamB => "Chorwacja", :start => "2012-06-14 18:00")
Match.create(:teamA => "Hiszpania", :teamB => "Irlandia", :start => "2012-06-14 20:45")

Match.create(:teamA => "Ukraina", :teamB => "Francja", :start => "2012-06-15 18:00")
Match.create(:teamA => "Szwecja", :teamB => "Anglia", :start => "2012-06-15 20:45")

Match.create(:teamA => "Grecja", :teamB => "Rosja", :start => "2012-06-16 20:45")
Match.create(:teamA => "Czechy", :teamB => "Polska", :start => "2012-06-16 20:45")

Match.create(:teamA => "Portugalia", :teamB => "Holandia", :start => "2012-06-17 20:45")
Match.create(:teamA => "Dania", :teamB => "Niemcy", :start => "2012-06-17 20:45")

Match.create(:teamA => "Chorwacja", :teamB => "Hiszpania", :start => "2012-06-18 20:45")
Match.create(:teamA => "Włochy", :teamB => "Irlandia", :start => "2012-06-18 20:45")

Match.create(:teamA => "Szwecja", :teamB => "Francja", :start => "2012-06-19 20:45")
Match.create(:teamA => "Anglia", :teamB => "Ukraina", :start => "2012-06-19 20:45")
