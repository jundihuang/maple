ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def check_spescial_and_classification
     classifications = Classification.all
     classifications.each do |classification|
       assert_select 'a[href=?]', articles_by_classification_path(classification), text: classification.title
     end
     specials = Special.all
     specials.each do |special|
       assert_select 'a[href=?]', articles_by_special_path(special), text: special.title
     end
     tags = ActsAsTaggableOn::Tag.all
     tags.each do |tag|
       assert_select 'a[href=?]',articles_by_tag_path(tag)
     end
  end
end
