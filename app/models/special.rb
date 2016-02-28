# coding: utf-8
# 专题
class Special < ActiveRecord::Base
  has_many :articles
  validates :title,
            presence: true,
            length: { maximum: 20 },
            uniqueness: true
end
