# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Komunikaty
Notification.create(content: 'W meczach fazy pucharowej typujemy wyniki tylko do 90 minuty spotkania. Czyli typ "remis" jest jak najbardziej poprawny. Oznaczać to będzie że drużyny po zagraniu przepisowych 90 minut będą miały dogrywkę.')

matches = [
  { start: '2024-06-14 21:00 CEST', team_a: 'Niemcy', team_b: 'Szkocja' },
  { start: '2024-06-15 15:00 CEST', team_a: 'Węgry', team_b: 'Szwajcaria' },
  { start: '2024-06-15 18:00 CEST', team_a: 'Hiszpania', team_b: 'Chorwacja' },
  { start: '2024-06-15 21:00 CEST', team_a: 'Włochy', team_b: 'Albania' },
  { start: '2024-06-16 15:00 CEST', team_a: 'Polska', team_b: 'Holandia' },
  { start: '2024-06-16 18:00 CEST', team_a: 'Słowenia', team_b: 'Dania' },
  { start: '2024-06-16 21:00 CEST', team_a: 'Serbia', team_b: 'Anglia' },
  { start: '2024-06-17 15:00 CEST', team_a: 'Rumunia', team_b: 'Ukraina' },
  { start: '2024-06-17 18:00 CEST', team_a: 'Belgia', team_b: 'Słowacja' },
  { start: '2024-06-17 21:00 CEST', team_a: 'Austria', team_b: 'Francja' },
  { start: '2024-06-18 18:00 CEST', team_a: 'Turcja', team_b: 'Gruzja' },
  { start: '2024-06-18 21:00 CEST', team_a: 'Portugalia', team_b: 'Czechy' },
  { start: '2024-06-19 15:00 CEST', team_a: 'Chorwacja', team_b: 'Albania' },
  { start: '2024-06-19 18:00 CEST', team_a: 'Niemcy', team_b: 'Węgry' },
  { start: '2024-06-19 21:00 CEST', team_a: 'Szkocja', team_b: 'Szwajcaria' },
  { start: '2024-06-20 15:00 CEST', team_a: 'Słowenia', team_b: 'Serbia' },
  { start: '2024-06-20 18:00 CEST', team_a: 'Dania', team_b: 'Anglia' },
  { start: '2024-06-20 21:00 CEST', team_a: 'Hiszpania', team_b: 'Włochy' },
  { start: '2024-06-21 15:00 CEST', team_a: 'Słowacja', team_b: 'Ukraina' },
  { start: '2024-06-21 18:00 CEST', team_a: 'Polska', team_b: 'Austria' },
  { start: '2024-06-21 21:00 CEST', team_a: 'Holandia', team_b: 'Francja' },
  { start: '2024-06-22 15:00 CEST', team_a: 'Gruzja', team_b: 'Czechy' },
  { start: '2024-06-22 18:00 CEST', team_a: 'Turcja', team_b: 'Portugalia' },
  { start: '2024-06-22 21:00 CEST', team_a: 'Belgia', team_b: 'Rumunia' },
  { start: '2024-06-23 21:00 CEST', team_a: 'Szkocja', team_b: 'Węgry' },
  { start: '2024-06-23 21:00 CEST', team_a: 'Szwajcaria', team_b: 'Niemcy' },
  { start: '2024-06-24 21:00 CEST', team_a: 'Albania', team_b: 'Hiszpania' },
  { start: '2024-06-24 21:00 CEST', team_a: 'Chorwacja', team_b: 'Włochy' },
  { start: '2024-06-25 18:00 CEST', team_a: 'Francja', team_b: 'Polska' },
  { start: '2024-06-25 18:00 CEST', team_a: 'Holandia', team_b: 'Austria' },
  { start: '2024-06-25 21:00 CEST', team_a: 'Dania', team_b: 'Serbia' },
  { start: '2024-06-25 21:00 CEST', team_a: 'Anglia', team_b: 'Słowenia' },
  { start: '2024-06-26 18:00 CEST', team_a: 'Słowacja', team_b: 'Rumunia' },
  { start: '2024-06-26 18:00 CEST', team_a: 'Ukraina', team_b: 'Belgia' },
  { start: '2024-06-26 21:00 CEST', team_a: 'Czechy', team_b: 'Turcja' },
  { start: '2024-06-26 21:00 CEST', team_a: 'Portugalia', team_b: 'Gruzja' },
  # 1/8 finału
  { start: '2024-06-29 18:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-06-29 21:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-06-30 18:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-06-30 21:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-01 18:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-01 21:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-02 18:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-02 21:00 CEST', team_a: '?', team_b: '?' },
  # Ćwierćfinały
  { start: '2024-07-05 18:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-05 21:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-06 18:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-06 21:00 CEST', team_a: '?', team_b: '?' },
  # Półfinały
  { start: '2024-07-09 21:00 CEST', team_a: '?', team_b: '?' },
  { start: '2024-07-10 21:00 CEST', team_a: '?', team_b: '?' },
  # Finał
  { start: '2024-07-14 21:00 CEST', team_a: '?', team_b: '?' }
]

matches.each do |match|
  Match.create(match)
end
