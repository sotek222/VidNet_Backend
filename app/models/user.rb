class User < ApplicationRecord
  has_secure_password

  has_many :friendered_users, foreign_key: :friender_id, class_name: 'Friend'
  has_many :friendees, through: :friendered_users

  has_many :friending_users, foreign_key: :friendee_id, class_name: 'Friend'
  has_many :frienders, through: :friending_users

  has_many :theatre_users
  has_many :theatres, through: :theatre_users
  # Still need to set up the one to many with theatre through host_id
  has_many :theatres

end
