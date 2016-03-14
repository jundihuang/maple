require 'test_helper'

TITLE_MIN_LENGTH = 5
BODY_MIN_LENGTH = 20

class ArticleTest < ActiveSupport::TestCase

  test "title not exist" do
    @article = Article.first
    @article.title = nil
    @article.save
    assert_not @article.save, "Saved the article without a title"
  end

  test "title is unique" do
    @article1 = Article.first
    @article2 = Article.last
    @article2.title = @article1.title
    assert_not @article2.save, "Title must be unique"
  end

  test "title length must be restrict more than #{TITLE_MIN_LENGTH} character" do
    @article = Article.first
    @article.title = 'l' * TITLE_MIN_LENGTH
    assert @article.save
    @article.title = 'l' * (TITLE_MIN_LENGTH - 1)
    assert_not @article.save,
    "Title length must be restrict more than #{TITLE_MIN_LENGTH} character"
  end

  test "body not exist" do
    @article = Article.first
    @article.body = nil
    assert_not @article.save, "Saved the article without a title."
  end

  test "body length must be restrict more than #{BODY_MIN_LENGTH} character" do
    @article = Article.first
    @article.body = 'l' * BODY_MIN_LENGTH
    assert @article.save
    @article.body = 'l' * (BODY_MIN_LENGTH - 1)
    assert_not @article.save,
    "body length must be restrict more than #{BODY_MIN_LENGTH} character."
  end
end
