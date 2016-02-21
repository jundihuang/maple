# coding: utf-8
# 文章
class Article < ActiveRecord::Base
  has_many :specials
  has_many :classifications
  validates :title,
            presence: true,
            length: { minimum: 5},
            uniqueness: true
  validates :body,
            presence: true,
            length: { minimum: 20}
  validates_associated :specials
  validates_associated :classifications
end
