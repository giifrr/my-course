require "application_system_test_case"

class LesssonsTest < ApplicationSystemTestCase
  setup do
    @lessson = lesssons(:one)
  end

  test "visiting the index" do
    visit lesssons_url
    assert_selector "h1", text: "Lesssons"
  end

  test "should create lessson" do
    visit lesssons_url
    click_on "New lessson"

    fill_in "Content", with: @lessson.content
    fill_in "Course", with: @lessson.course_id
    fill_in "Title", with: @lessson.title
    click_on "Create Lessson"

    assert_text "Lessson was successfully created"
    click_on "Back"
  end

  test "should update Lessson" do
    visit lessson_url(@lessson)
    click_on "Edit this lessson", match: :first

    fill_in "Content", with: @lessson.content
    fill_in "Course", with: @lessson.course_id
    fill_in "Title", with: @lessson.title
    click_on "Update Lessson"

    assert_text "Lessson was successfully updated"
    click_on "Back"
  end

  test "should destroy Lessson" do
    visit lessson_url(@lessson)
    click_on "Destroy this lessson", match: :first

    assert_text "Lessson was successfully destroyed"
  end
end
