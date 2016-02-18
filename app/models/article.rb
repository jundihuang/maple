class Article < ActiveRecord::Base
  has_many :special
  has_many :classification
  validates :title, presence: true,
            length: { minimum: 5 }
end
