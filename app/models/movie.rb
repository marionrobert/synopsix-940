class Movie < ApplicationRecord
  belongs_to :category
  require 'uri'
  require 'net/http'
  require 'openssl'

end
