require "test_helper"

class LesssonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lessson = lesssons(:one)
  end

  test "should get index" do
    get lesssons_url
    assert_response :success
  end

  test "should get new" do
    get new_lessson_url
    assert_response :success
  end

  test "should create lessson" do
    assert_difference("Lessson.count") do
      post lesssons_url, params: { lessson: { content: @lessson.content, course_id: @lessson.course_id, title: @lessson.title } }
    end

    assert_redirected_to lessson_url(Lessson.last)
  end

  test "should show lessson" do
    get lessson_url(@lessson)
    assert_response :success
  end

  test "should get edit" do
    get edit_lessson_url(@lessson)
    assert_response :success
  end

  test "should update lessson" do
    patch lessson_url(@lessson), params: { lessson: { content: @lessson.content, course_id: @lessson.course_id, title: @lessson.title } }
    assert_redirected_to lessson_url(@lessson)
  end

  test "should destroy lessson" do
    assert_difference("Lessson.count", -1) do
      delete lessson_url(@lessson)
    end

    assert_redirected_to lesssons_url
  end
end
