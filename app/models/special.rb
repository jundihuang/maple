# coding: utf-8
# 专题
class Special < ActiveRecord::Base
  has_many :articles
  validates :title,
            presence: true,
            length: { maximum: 20 },
            uniqueness: true
  extend FriendlyId

  friendly_id :title, use: [:slugged, :finders, :history]
  
  #override 
  def normalize_friendly_id(text)
    "#{PinYin.of_string(text).to_s.to_slug.normalize.to_s}"
  end
  
  #override  title更新时更新slug
  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
