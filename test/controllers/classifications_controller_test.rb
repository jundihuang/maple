require 'test_helper'

class ClassificationsControllerTest < ActionController::TestCase

  def setup
    @classification = classifications(:clsone)
  end

  test "show articles by classification" do
    get :show,id:@classification
    assert_response :success

    @articles =  @classification.articles.to_a.paginate(page: 1,per_page: 20)
    @articles.each do |article|
      assert_select 'a[href=?]', article_path(article), text: article.title
    end
    check_spescial_and_classification()
  end
end
