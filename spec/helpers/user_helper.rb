module UserHelper

  def request_login(email="me@some.bg")
    user = FactoryGirl.create(:user, email: email, password: '654321')

    visit "/users/sign_in"

    fill_in "Email",    :with => user.email
    fill_in "Password", :with => user.password

    click_button "Login"
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
end
