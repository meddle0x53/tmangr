require "spec_helper"

describe "user log in" do
  include UserHelper

  it "allows users to log in if they are registered" do
    request_login

    page.should have_content("Signed in successfully.")
  end
end
