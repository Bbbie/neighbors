require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  test "login and create card" do
    # TO HAVE A COMMUNITY LINKED TO USER
    visit root_path
    click_on("Sign Up")

    fill_in "address_input", with: "Dircksenstraße 117, 10178 Berlin"
    click_on "Find community"
    click_on "Create account"

    fill_in "user_first_name", with: "George"
    fill_in "user_last_name", with: "Example"
    fill_in "user_email", with: "george@example.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_on "Create account"

    fill_in "profile_floor", with: "VH 1 EG"
    fill_in "profile_phone_number", with: "12345423"
    fill_in "profile_about", with: "Hey there I am a test"
    click_on "Save"

    visit cards_path
    find('button.btn-shadow').click
    find('select#card_board option', :text => "Mutual Help 🤝").click
    find('label.form-check-label', :text => "action").click
    fill_in "card_title", with: "This is a test for cards"

    assert_selector "h1", text: "Mutual help"
    assert_selector "p", text: "This is a test for cards"
    assert_selector ".custom-card", count: Card.count
  end
end
