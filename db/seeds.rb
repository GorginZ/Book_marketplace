# Test admin
adm = User.create(
  user_name: "Admin",
  email: 'admin@test.com',
  password: '123456',
  admin: true
)
10.times do 
  User.create(
  user_name: Faker::Name.name,
  email: Faker::Internet.email,
  password: '123456',
  admin: false
)
end

 Category.create(
book_category: "Literature",
summary: "Classics, Critical Theory, Literary Criticism"
 )

 Category.create(
  book_category: "Law",
  summary: "Corporate law, Criminal law, Copywrite law, Social Justice Law"
 )
 Category.create(
  book_category: "Biomed",
  summary: "Immunology, Pathophysiology, Anatomy"
 )
 Category.create(
  book_category: "Mathematics",
  summary: "Calculus, Mathematics theory"
 )
 Category.create(
   book_category: "Philosophy",
   summary: "Ethics, Bioethics, Peter Singer, Metaphysics, Peter Singer, Peter Singer"
 )

 Category.create(
   book_category: "Latin",
   summary: "carpe diem"
 )
 Category.create(
  book_category: "Psychology",
  summary: "Psychology, Public Health Psychology, Clinical Psychology"
)
Category.create(
  book_category: "Nursing",
  summary: "Nursing, Surgical Nursing, ICU Nursing, Medical Nursing, Physiology"
)


  Listing.create(
  title: "Understanding Pathophysiology ED3",
  isbn:  9780729542647,
  author: "Judy Craft and Christopher Gordon",
  category_id: 4,
  keywords: "biomed, pathophysiology",
  price: 30.00,
  available: true,
  user_id: 1
  
)
Listing.create(
  title: "Criminal Laws ED6",
  isbn:   9781862879843,
  author: "Brown, David",
  category_id: 3,
  keywords: "Law criminal law and process of new south whales",
  price: 70.00,
  available: true,
  user_id: 1
  
)
Listing.create(
  title: "Phsychology ED3",
  isbn:    9781760422790,
  author: " Passer, Michael W",
  category_id: 7,
  keywords: "Phsychology, science of mind and behaviour",
  price: 50.00,
  available: true,
  user_id: 1
  
)
Listing.create(
  title: "Lewis's Medial Surgical Nursing ANZ 4th edition",
  isbn:  9780729541770,
  author: "Brown, Edwards, Lord Buckley, Seaton",
  category_id: 8,
  keywords: "Nursing, managing clinical problems",
  price: 50.00,
  available: true,
  user_id: 1
  
)
Listing.create(
  title: "Evidence-based Nursing, an introduction",
  isbn:   9781405145978,
  author: " Cullum, Nicky",
  category_id: 8,
  keywords: "Nursing, managing clinical problems, patient care, clinical outcomes",
  price: 40.00,
  available: true,
  user_id: 1
  
)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
