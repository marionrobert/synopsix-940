class Category < ApplicationRecord
  has_many :movies
  has_one_attached :photo
end
