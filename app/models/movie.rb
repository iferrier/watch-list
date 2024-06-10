class Movie < ApplicationRecord
  has_one_attached :photo
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
