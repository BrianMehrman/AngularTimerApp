require 'spec_helper'

describe Api::TasksController do


  let(:user) { create(:user_with_tasks) }
  let(:task_list) { user.task_lists.first }
  let(:task1) { task_list.tasks[0] }
  let(:task2) { task_list.tasks[1] }

  before do
    2.times { create(:task, list: task_list, creator: user) }
    sign_in(user)
  end

  describe '#create' do
    let(:post_create) do
      post :create, task_list_id: task_list.id, task: {description: "New task"}, format: :json
    end

    it "should add the record to the database" do
      expect {
        post_create
      }.to change(Task, :count).by(1)
    end

    it "should return 200 OK" do
      post_create
      response.should be_success
    end

    it "should return json of the just created record" do
      post_create
      json_response["id"].should == be_an(Integer)
      json_response["complete"].should == false
      json_response["description"].should == "New task"
      json_response["due_date"].should == nil
    end
  end

end
