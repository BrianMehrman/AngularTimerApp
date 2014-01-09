require 'spec_helper'

describe TasksController do

  context "for a user with the three tasks" do
    let(:user){ create(:user) }

    let(:list){ create(:task_list, name:"My Test list")}

    before do
      create_list(:task, 3, creator:user, list:list)
    end

    describe "#index" do
      context "when authenticated as a user" do
        before { sign_in(user) }
        it "should return an instance variable with user's tasks" do
          get :index
          expect(assigns(:tasks)).to eq(user.tasks.to_a)
        end
      end
    end
  end
end
