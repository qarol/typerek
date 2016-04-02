# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Grupa A
Match.create(team_a: 'Francja', team_b: 'Rumunia', start: '2016-06-10 21:00')
Match.create(team_a: 'Albania', team_b: 'Szwajcaria', start: '2016-06-11 15:00')
Match.create(team_a: 'Rumunia', team_b: 'Szwajcaria', start: '2016-06-15 18:00')
Match.create(team_a: 'Francja', team_b: 'Albania', start: '2016-06-15 21:00')
Match.create(team_a: 'Szwajcaria', team_b: 'Francja', start: '2016-06-19 21:00')
Match.create(team_a: 'Rumunia', team_b: 'Albania', start: '2016-06-19 21:00')
# Grupa B
Match.create(team_a: 'Walia', team_b: 'Słowacja', start: '2016-06-11 18:00')
Match.create(team_a: 'Anglia', team_b: 'Rosja', start: '2016-06-11 21:00')
Match.create(team_a: 'Rosja', team_b: 'Słowacja', start: '2016-06-15 15:00')
Match.create(team_a: 'Anglia', team_b: 'Walia', start: '2016-06-16 15:00')
Match.create(team_a: 'Słowacja', team_b: 'Anglia', start: '2016-06-20 21:00')
Match.create(team_a: 'Rosja', team_b: 'Walia', start: '2016-06-20 21:00')
# Grupa C
Match.create(team_a: 'Polska', team_b: 'Irlandia Płn.', start: '2016-06-12 18:00')
Match.create(team_a: 'Niemcy', team_b: 'Ukraina', start: '2016-06-12 21:00')
Match.create(team_a: 'Ukraina', team_b: 'Irlandia Płn.', start: '2016-06-16 18:00')
Match.create(team_a: 'Niemcy', team_b: 'Polska', start: '2016-06-16 21:00')
Match.create(team_a: 'Ukraina', team_b: 'Polska', start: '2016-06-21 18:00')
Match.create(team_a: 'Irlandia Płn.', team_b: 'Niemcy', start: '2016-06-21 18:00')
# Grupa D
Match.create(team_a: 'Turcja', team_b: 'Chorwacja', start: '2016-06-12 15:00')
Match.create(team_a: 'Hiszpania', team_b: 'Czechy', start: '2016-06-13 15:00')
Match.create(team_a: 'Czechy', team_b: 'Chorwacja', start: '2016-06-17 18:00')
Match.create(team_a: 'Hiszpania', team_b: 'Turcja', start: '2016-06-17 21:00')
Match.create(team_a: 'Chorwacja', team_b: 'Hiszpania', start: '2016-06-21 21:00')
Match.create(team_a: 'Czechy', team_b: 'Turcja', start: '2016-06-21 21:00')
# Grupa E
Match.create(team_a: 'Irlandia', team_b: 'Szwecja', start: '2016-06-13 18:00')
Match.create(team_a: 'Belgia', team_b: 'Włochy', start: '2016-06-13 21:00')
Match.create(team_a: 'Włochy', team_b: 'Szwecja', start: '2016-06-17 15:00')
Match.create(team_a: 'Belgia', team_b: 'Irlandia', start: '2016-06-18 15:00')
Match.create(team_a: 'Włochy', team_b: 'Irlandia', start: '2016-06-22 21:00')
Match.create(team_a: 'Szwecja', team_b: 'Belgia', start: '2016-06-22 21:00')
# Grupa F
Match.create(team_a: 'Austria', team_b: 'Węgry', start: '2016-06-14 18:00')
Match.create(team_a: 'Portugalia', team_b: 'Islandia', start: '2016-06-14 21:00')
Match.create(team_a: 'Islandia', team_b: 'Węgry', start: '2016-06-18 18:00')
Match.create(team_a: 'Portugalia', team_b: 'Austria', start: '2016-06-18 21:00')
Match.create(team_a: 'Węgry', team_b: 'Portugalia', start: '2016-06-22 18:00')
Match.create(team_a: 'Islandia', team_b: 'Austria', start: '2016-06-22 18:00')
# 1/8
Match.create(team_a: 'A2', team_b: 'C2', start: '2016-06-25 15:00')
Match.create(team_a: 'D1', team_b: 'B/E/F3', start: '2016-06-25 21:00')
Match.create(team_a: 'B1', team_b: 'A/C/D3', start: '2016-06-25 18:00')
Match.create(team_a: 'F1', team_b: 'E2', start: '2016-06-26 21:00')
Match.create(team_a: 'C1', team_b: 'A/B/F3', start: '2016-06-26 18:00')
Match.create(team_a: 'A1', team_b: 'C/D/E3', start: '2016-06-26 15:00')
Match.create(team_a: 'E1', team_b: 'D2', start: '2016-06-27 18:00')
Match.create(team_a: 'B2', team_b: 'F2', start: '2016-06-27 21:00')
# 1/4
Match.create(team_a: 'W53', team_b: 'W54', start: '2016-06-30 21:00')
Match.create(team_a: 'W49', team_b: 'W50', start: '2016-07-01 21:00')
Match.create(team_a: 'W55', team_b: 'W56', start: '2016-07-02 21:00')
Match.create(team_a: 'W51', team_b: 'W52', start: '2016-07-03 21:00')
# 1/2
Match.create(team_a: 'W57', team_b: 'W58', start: '2016-07-06 21:00')
Match.create(team_a: 'W59', team_b: 'W60', start: '2016-07-07 21:00')
# Final
Match.create(team_a: 'W61', team_b: 'W62', start: '2016-07-10 21:00')
