# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.find_or_create_by(:email => 'admin@example.com') do |user|
  user.password = '12345678'
end

unless Book.exists?
  now = Time.now.to_f
  long_ago = 5.years.ago.to_f
  
  def rtime(now,init_time)
    x_init_time = init_time.to_time.to_f
    Time.at(rand * (now - x_init_time) + x_init_time)
  end
  e1 = Editorial.create name: 'Ediciones B'
  e2 = Editorial.create name: 'RBA'
  e3 = Editorial.create name: 'Morgan Kaufmann Publishers'
  e4 = Editorial.create name: 'SitePoint'
  e5 = Editorial.create name: 'O\'Reilly'
  e6 = Editorial.create name: 'New Riders Publishing'

  a1 = Author.create name: "Orson Scott Card"
  a2 = Author.create name: "Rick Yancey"
  a3 = Author.create name: "Brandon Sanderson"
  a4 = Author.create name: "Pawan Vora"
  a5 = Author.create name: "Jason Beaird"
  a6 = Author.create name: "Jennifer Niederst Robbins"
  a7 = Author.create name: "Steve Krug"

  Book.create title: 'La sombra de Ender', editorial_id: e1.id, original_title: "Ender's Shadow", translation: 'Rafael Marín', edition: 1, edition_date: (init_time = Date.parse('2012-01-01')), edition_place: 'Barcelona', publication_year: 1999, isbn: '978-84-9872-591-9',created_at: rtime(now,init_time), author_ids: a1.id 

  Book.create title: 'La sombra del Hegemón', editorial_id: e1.id, original_title: 'Hegemon\'s Shadow', translation: 'Rafael Marín', edition: 1, edition_date: (init_time = Date.parse('2014-02-01')), edition_place: 'Barcelona', publication_year: 2001, isbn: '978-84-9872-909-2', created_at: rtime(now,init_time), author_ids: a1.id 

  Book.create title: 'La quinta ola', editorial_id: e2.id, original_title: 'The 5th Wave', translation: 'Pilar Ramírez Tello', edition: 1, edition_date: (init_time = Date.parse('2013-09-01')), edition_place: 'Barcelona', publication_year: 2013, isbn: '978-84-272-0422-5', created_at: rtime(now,init_time), author_ids: a2.id 
  
  Book.create title: 'El imperio final', editorial_id: e1.id, original_title: 'Mistborn', translation: 'Rafael Marín Trechera', edition: 2, edition_date: (init_time = Date.parse('2011-06-01')), edition_place: 'Barcelona', publication_year: 2007, isbn: '978-84-666-3199-0',created_at: rtime(now,init_time), author_ids: a3.id   

  Book.create title: 'El pozo de la ascensión', editorial_id: e1.id, original_title: 'The Well of Ascension: Book Two of Mistborn', translation: 'Rafael Marín Trechera', edition: 3, edition_date: (init_time = Date.parse('2011-06-01')), edition_place: 'Barcelona', publication_year: 2009, isbn: nil, created_at: rtime(now,init_time), author_ids: a3.id   

  Book.create title: 'Web Application Design Patterns', editorial_id: e3.id, original_title: nil, translation: nil, edition: 1, edition_date: nil, edition_place: 'Canada', publication_year: 2009, isbn: '978-0-12-374265-0', created_at: rtime(now,Date.parse('2009-06-01')), author_ids: a4.id   

  Book.create title: 'The principles of Beautiful Web Design',  editorial_id: e4.id, original_title: nil, translation: nil, edition: 2, edition_date: (init_time = Date.parse('2010-11-01')), edition_place: 'Canada', publication_year: 2010, isbn: '978-0-9805768-9-4',created_at: rtime(now,init_time), author_ids: a5.id   

  Book.create title: 'Learning Web Design', editorial_id: e5.id, original_title: nil, translation: nil, edition: 3, edition_date: (init_time = Date.parse('2007-06-01')), edition_place: nil, publication_year: 2001, isbn: '978-0-596-52752-5', created_at: rtime(now,init_time), author_ids: a6.id   
  Book.create title: 'Don’t Make Me Think!', editorial_id: e6.id, original_title: nil, translation: nil, edition: 2, edition_date: (init_time = Date.parse('2006-06-01')), edition_place: 'United States of America', publication_year: 2006, isbn: '0-321-34475-8',
      created_at: rtime(now,init_time), author_ids: a7.id     

end