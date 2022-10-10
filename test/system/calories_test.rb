require "application_system_test_case"

class CaloriesTest < ApplicationSystemTestCase
  setup do
    @calory = calories(:one)
  end

  test "visiting the index" do
    visit calories_url
    assert_selector "h1", text: "Calories"
  end

  test "should create calorie" do
    visit calories_url
    click_on "New calorie"

    fill_in "Burned or consumed", with: @calory.burned_or_consumed
    fill_in "Calories number", with: @calory.calories_number
    fill_in "Comment", with: @calory.comment
    click_on "Create Calorie"

    assert_text "Calorie was successfully created"
    click_on "Back"
  end

  test "should update Calorie" do
    visit calory_url(@calory)
    click_on "Edit this calorie", match: :first

    fill_in "Burned or consumed", with: @calory.burned_or_consumed
    fill_in "Calories number", with: @calory.calories_number
    fill_in "Comment", with: @calory.comment
    click_on "Update Calorie"

    assert_text "Calorie was successfully updated"
    click_on "Back"
  end

  test "should destroy Calorie" do
    visit calory_url(@calory)
    click_on "Destroy this calorie", match: :first

    assert_text "Calorie was successfully destroyed"
  end
end
