require 'test_helper'

TITLE_MAX_LENGTH = 20

class ClassificationTest < ActiveSupport::TestCase
  test "title not exist" do
    @classification = Classification.new
    assert_not @classification.save, "Saved the classification without a title."
  end

  test "title is unique" do
    @classification1 = Classification.new(title: "Ruby")
    @classification2 = Classification.new(title: "Ruby")
    @classification1.save
    assert_not @classification2.save, "Title must be unique."
  end

  test "title length must be restrict less than #{TITLE_MAX_LENGTH} character" do
    string = "a"
    @classification1 = Classification.new(title: string * TITLE_MAX_LENGTH)
    @classification2 = Classification.new(title: string * (TITLE_MAX_LENGTH + 1))
    assert @classification1.save
    assert_not @classification2.save,
    "Title length must be restrict less than #{TITLE_MAX_LENGTH} character."
  end
end
