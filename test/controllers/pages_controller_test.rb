require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about_me" do
    get pages_about_me_url
    assert_response :success
  end

  test "should get proyectos" do
    get pages_proyectos_url
    assert_response :success
  end

  test "should get filosofia" do
    get pages_filosofia_url
    assert_response :success
  end

  test "should get computacion" do
    get pages_computacion_url
    assert_response :success
  end
end
