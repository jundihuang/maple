# coding: utf-8
# 专题
class Special < ActiveRecord::Base
  belongs_to :article
  validates :title,
            presence: true,
            length: { maximum: 20 },
            uniqueness: true
end
