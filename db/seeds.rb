# Test admin
adm = User.create(
  user_name: "Admin",
  email: 'admin@test.com',
  password: '123456',
  admin: true
)
User.create(
  user_name: "Admin",
  email: 'admin@test.com',
  password: '123456',
  admin: false
)

 Category.create(
book_category: "Literature",
summary: "Classics, Critical Theory, Literary Criticism"
 )

 Category.create(
  book_category: "Law",
  summary: "Corporate law, Criminal law, Copywrite law, all the law you want"
 )
 Category.create(
  book_category: "Biomed",
  summary: "Cellular biology, neurology"
 )
 Category.create(
  book_category: "Mathematics",
  summary: "Calculus, Mathematics theory"
 )
 Category.create(
   book_category: "Philosophy",
   summary: "Ethics, Bioethics, Peter Singer, Metaphysics, Peter Singer"
 )

 Category.create(
   book_category: "Latin",
   summary: "carpe diem"
 )

5.times do 
  Listing.create(
  title: "textbook",
  isbn: 1234567890,
  author: "author of book",
  category: [1..6].sample,
  keywords: "literary theory",
  available: true,
  visible: true
  
)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
