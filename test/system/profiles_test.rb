require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  test "visiting a profile" do
    log_in as users(:ammy)
    visit "/profiles/new"
    fill_in "floor", with: "VH 1 EG"
    fill_in "phone_number", with: "12345423"
    fill_in "about", with: "Hey there I am a test"
    click_on "Save"

    save_and_open_screenshot

    assert_equal cards_path, page.current_path
  end
end
