require "spec_helper"

describe Api::V1::TasksController do
  login_user
  render_views

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end


  describe "#index" do

    before do
      @owned_task = FactoryGirl.create(:task, description: 'owned by me',
        owner: subject.current_user)
      @assigned_task = FactoryGirl.create(:task, description: 'performed by me',
        performer: subject.current_user)
      @just_task = FactoryGirl.create(:task, description: 'not mine!')

      get :index, format: :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should list only taks owned or performed by the current user" do
      response.body.should include(@owned_task.description)
      response.body.should include(@assigned_task.description)
      response.body.should_not include(@just_task.description)
    end
  end
end
