require 'test_helper'

TITLE_MAX_LENGTH = 20
class SpecialTest < ActiveSupport::TestCase


  test "title not exist" do
    @special = Special.new
    assert_not @special.save, "Saved the special without a title."
  end

  test "title is unique" do
    @special1 = Special.new(title: "Ruby")
    @special2 = Special.new(title: "Ruby")
    @special1.save
    assert_not @special2.save, "Title must be unique."
  end

  test "title length must be restrict less than #{TITLE_MAX_LENGTH} character" do
    string = "a"
    @special1 = Special.new(title: string * TITLE_MAX_LENGTH)
    @special2 = Special.new(title: string * (TITLE_MAX_LENGTH + 1))
    assert @special1.save
    assert_not @special2.save,
    "Title length must be restrict less than #{TITLE_MAX_LENGTH} character."
  end
end
