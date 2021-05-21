# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Komunikaty
Notification.create(content: 'W meczach fazy pucharowej typujemy wyniki tylko do 90 minuty spotkania. Czyli typ "remis" jest jak najbardziej poprawny. Oznaczać to będzie że drużyny po zagraniu przepisowych 90 minut będą miały dogrywkę.')

# Grupa A
Match.create(team_a: 'Turcja', team_b: 'Włochy', start: '2021-06-11 21:00')
Match.create(team_a: 'Walia', team_b: 'Szwajcaria', start: '2021-06-12 15:00')
Match.create(team_a: 'Turcja', team_b: 'Walia', start: '2021-06-16 18:00')
Match.create(team_a: 'Włochy', team_b: 'Szwajcaria', start: '2021-06-16 21:00')
Match.create(team_a: 'Szwajcaria', team_b: 'Turcja', start: '2021-06-20 18:00')
Match.create(team_a: 'Włochy', team_b: 'Walia', start: '2021-06-20 18:00')
# Grupa B
Match.create(team_a: 'Dania', team_b: 'Finlandia', start: '2021-06-12 18:00')
Match.create(team_a: 'Belgia', team_b: 'Rosja', start: '2021-06-12 21:00')
Match.create(team_a: 'Finlandia', team_b: 'Rosja', start: '2021-06-16 15:00')
Match.create(team_a: 'Dania', team_b: 'Belgia', start: '2021-06-17 18:00')
Match.create(team_a: 'Rosja', team_b: 'Dania', start: '2021-06-21 21:00')
Match.create(team_a: 'Finlandia', team_b: 'Belgia', start: '2021-06-21 21:00')
# Grupa C
Match.create(team_a: 'Austria', team_b: 'Macedonia Płn.', start: '2021-06-13 18:00')
Match.create(team_a: 'Holandia', team_b: 'Ukraina', start: '2021-06-13 21:00')
Match.create(team_a: 'Ukraina', team_b: 'Macedonia Płn.', start: '2021-06-17 15:00')
Match.create(team_a: 'Holandia', team_b: 'Austria', start: '2021-06-17 21:00')
Match.create(team_a: 'Macedonia Płn.', team_b: 'Holandia', start: '2021-06-21 18:00')
Match.create(team_a: 'Ukraina', team_b: 'Austria', start: '2021-06-21 18:00')
# Grupa D
Match.create(team_a: 'Anglia', team_b: 'Chorwacja', start: '2021-06-13 15:00')
Match.create(team_a: 'Szkocja', team_b: 'Czechy', start: '2021-06-14 15:00')
Match.create(team_a: 'Chorwacja', team_b: 'Czechy', start: '2021-06-18 18:00')
Match.create(team_a: 'Anglia', team_b: 'Szkocja', start: '2021-06-18 21:00')
Match.create(team_a: 'Chorwacja', team_b: 'Szkocja', start: '2021-06-22 21:00')
Match.create(team_a: 'Czechy', team_b: 'Anglia', start: '2021-06-22 21:00')
# Grupa E
Match.create(team_a: 'Polska', team_b: 'Słowacja', start: '2021-06-14 18:00')
Match.create(team_a: 'Hiszpania', team_b: 'Szwecja', start: '2021-06-14 21:00')
Match.create(team_a: 'Szwecja', team_b: 'Słowacja', start: '2021-06-18 15:00')
Match.create(team_a: 'Hiszpania', team_b: 'Polska', start: '2021-06-19 21:00')
Match.create(team_a: 'Słowacja', team_b: 'Hiszpania', start: '2021-06-23 18:00')
Match.create(team_a: 'Szwecja', team_b: 'Polska', start: '2021-06-23 18:00')
# Grupa F
Match.create(team_a: 'Węgry', team_b: 'Portugalia', start: '2021-06-15 18:00')
Match.create(team_a: 'Francja', team_b: 'Niemcy', start: '2021-06-15 21:00')
Match.create(team_a: 'Węgry', team_b: 'Francja', start: '2021-06-19 15:00')
Match.create(team_a: 'Portugalia', team_b: 'Niemcy', start: '2021-06-19 18:00')
Match.create(team_a: 'Portugalia', team_b: 'Francja', start: '2021-06-23 21:00')
Match.create(team_a: 'Niemcy', team_b: 'Węgry', start: '2021-06-23 21:00')
# 1/8
Match.create(team_a: '?', team_b: '?', start: '2021-06-26 18:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-26 21:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-27 18:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-27 21:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-28 18:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-28 21:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-29 18:00')
Match.create(team_a: '?', team_b: '?', start: '2021-06-29 21:00')
# 1/4
Match.create(team_a: '?', team_b: '?', start: '2021-07-02 18:00')
Match.create(team_a: '?', team_b: '?', start: '2021-07-02 21:00')
Match.create(team_a: '?', team_b: '?', start: '2021-07-03 18:00')
Match.create(team_a: '?', team_b: '?', start: '2021-07-03 21:00')
# 1/2
Match.create(team_a: '?', team_b: '?', start: '2021-07-06 21:00')
Match.create(team_a: '?', team_b: '?', start: '2021-07-07 21:00')
# Final
Match.create(team_a: '?', team_b: '?', start: '2021-07-11 21:00')
