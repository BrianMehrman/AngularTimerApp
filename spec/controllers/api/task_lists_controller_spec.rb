require 'spec_helper'

describe Api::TaskListsController do

  context "for a user that has two task lists" do
    let(:user) { create(:user_with_task_lists, task_lists_count: 2) }
    let(:first_list) { user.task_lists.first }
    let(:second_list) { user.task_lists.last }
    let(:other_list) { create(:task_list) }


    describe "#index" do
      context "when authenticated as a user" do
        before {sign_in(user)}
        it "should return a json array of those task lists" do
          get :index, format: :json
          expect(json_response.to_json).to eq([first_list,second_list].to_json(:include=>[:tasks]))
        end
      end
    end

  end

end
