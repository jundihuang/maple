require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  test "should get home " do
    get :index
    assert_response :success
    first_page_of_articles = Article.paginate(page: 1,per_page: 20).order("id DESC")
    first_page_of_articles.each do |article|
      assert_select 'a[href=?]', article_path(article), text: article.title
    end
    check_spescial_and_classification()
  end
 
end
