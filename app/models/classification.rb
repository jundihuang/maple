# coding: utf-8
# 分类
class Classification < ActiveRecord::Base
  has_many :articles
  validates :title,
            presence: true,
            length: { maximum: 20 },
            uniqueness: true
end
