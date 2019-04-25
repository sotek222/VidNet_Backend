class TheatreUser < ApplicationRecord
  belongs_to :user
  belongs_to :theatre
end
