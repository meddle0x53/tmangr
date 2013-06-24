require "spec_helper"

describe "user registration" do
  it "provides a registration form for new users with an email address and password" do
    visit "/users/sign_up"

    fill_in "Email",                 :with => "test_user@tmangr.com"
    fill_in "Password",              :with => "tainamaina"
    fill_in "Confirm password", :with => "tainamaina"

    click_button "Register"

    page.should have_content("Welcome! You have signed up successfully.")
  end
end
