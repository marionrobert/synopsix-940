class Movie < ApplicationRecord
  belongs_to :category
  has_many :games, dependent: :destroy
  require 'uri'
  require 'net/http'
  require 'openssl'

end
