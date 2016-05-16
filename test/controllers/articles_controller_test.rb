require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @article = articles(:one);
    @classification = classifications(:clsone)
    Article.all.each do |article|
        article.tag_list = "north"
        article.save!
    end
  end

  test "should get show" do
     get :show, id:@article
     assert_response :success
     assert_select 'div.banner>h3', text: "Article"
     assert_select 'h3.article-title', text: @article.title
     if !@article.classification.nil? then
       assert_select 'h5.article-classification', text: "Classification: #{@article.title}"
     end
     assert_select 'div.article-content>p', text: @article.body
     check_spescial_and_classification()
  end

  test "should show articles by tag" do

    @tag = ActsAsTaggableOn::Tag.first
    get :show_articles_by_tag, slug: @tag
    assert_response :success
    @articles = Article.tagged_with(@tag.name).paginate(page: 1,per_page: 20).order("id DESC")
    articles.each do |article|
      assert_select 'a[href=?]', article_path(article), text: article.title
    end
    check_spescial_and_classification()
  end
end
