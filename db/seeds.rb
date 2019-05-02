# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.string "username"
# t.string "password_digest"
# t.string "email"
# t.string "image"
# t.string "location"


20.times do
  User.create(username: Faker::Internet.unique.username, password_digest: "123", email: Faker::Internet.unique.safe_email, location: Faker::Address.unique.full_address, image: Faker::Avatar.unique.image)
end

Inbox.create(user_id: 1);
Inbox.create(user_id: 2);
Inbox.create(user_id: 3);
Inbox.create(user_id: 4);
Inbox.create(user_id: 5);
Inbox.create(user_id: 6);
Inbox.create(user_id: 7);
Inbox.create(user_id: 8);
Inbox.create(user_id: 9);
Inbox.create(user_id: 10);
Inbox.create(user_id: 11);
Inbox.create(user_id: 12);
Inbox.create(user_id: 13);
Inbox.create(user_id: 14);
Inbox.create(user_id: 15);
Inbox.create(user_id: 16);
Inbox.create(user_id: 17);
Inbox.create(user_id: 18);
Inbox.create(user_id: 19);
Inbox.create(user_id: 20);
