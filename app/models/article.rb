# coding: utf-8
# 文章
class Article < ActiveRecord::Base
  belongs_to :special
  belongs_to :classification
  validates :title,
            presence: true,
            length: { minimum: 5},
            uniqueness: true
  validates :body,
            presence: true,
            length: { minimum: 20}
  validates_associated :special
  validates_associated :classification
  
end
