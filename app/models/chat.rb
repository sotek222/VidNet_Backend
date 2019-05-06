class Chat < ApplicationRecord
  belongs_to :theatre
  has_many :texts, dependent: :destroy
end
