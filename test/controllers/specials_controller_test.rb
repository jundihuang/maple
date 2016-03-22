require 'test_helper'

class SpecialsControllerTest < ActionController::TestCase

  def setup
    @special = specials(:speone)
  end

  test "show articles by special" do
    get :show, id:@special
    assert_response :success

    @articles =  @special.articles.to_a.paginate(page: 1,per_page: 20)
    @articles.each do |article|
      assert_select 'a[href=?]', article_path(article), text: article.title
    end
    check_spescial_and_classification()
  end
end
