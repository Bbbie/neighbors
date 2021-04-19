require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  test "create new profile after log in, redirect to cards#index" do
    login_as users(:ammy)
    visit "/profiles/new"
    fill_in "profile_floor", with: "VH 1 EG"
    fill_in "profile_phone_number", with: "12345423"
    fill_in "profile_about", with: "Hey there I am a test"
    click_on "Save"

    # save_and_open_screenshot

    assert_equal cards_path, page.current_path
  end

  test "see profile content" do
    login_as users(:ana)

    save_and_open_screenshot

    within('div#neighbors-index') do
      click_on ("Ana Garcia, VH, 3.OG")
    end

    save_and_open_screenshot
    # (params: [id: 33])
    # assert_selector "p.from-who", text: "Where I live"
    assert_text "What you've missed"
  end
end
