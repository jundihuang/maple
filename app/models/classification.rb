# coding: utf-8
# 分类
class Classification < ActiveRecord::Base
  belongs_to :article
  validates :title,
            presence: true,
            length: { maximum: 20 },
            uniqueness: true
end
