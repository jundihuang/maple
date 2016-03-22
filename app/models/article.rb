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
  acts_as_taggable
  validates_associated :special
  validates_associated :classification

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

  ActsAsTaggableOn::Tag.class_eval do
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
    
    #override 
    def normalize_friendly_id(text)
      "#{PinYin.of_string(text).to_s.to_slug.normalize.to_s}"
    end
  end
end
