require "spec_helper"

describe "stranger user visits" do
  it "is not able to see task list" do
    visit "/"


    page.should have_content("Login")
  end
end

describe "registered user visits" do
  include UserHelper

  before(:each) do
    request_login('meddle@some.fr')
  end

  it "is able to see task list" do
    visit "/"

    page.should_not have_content("Login")
  end

  it "can log out" do
    visit "/"

    page.should have_content("Log out")

    click_link 'Log out'

    visit "/"

    page.should have_content("Login")
  end
end
