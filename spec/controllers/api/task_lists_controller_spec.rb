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
      context "when not authenticated as that user" do
        it "should return error json with 401 HTTP status" do
          get :index, format: :json
          response.status.should == 401
          json_response.should == {'error' => 'You need to log in or sign up before continuing.'}
        end
      end
    end

    describe '#create' do
      let(:post_create) do
        post :create, list:{name:"My new list"}, format: :json
      end

      context "when authenticated as a user" do
        before {sign_in(user)}

        it "should add the record to the database" do
          expect {
            post_create
          }.to change(TaskList, :count).by(1)
        end

        it "should return 200 OK" do
          post_create
          response.should be_success
        end

        it 'shoud return the json of the newly created record' do
          post_create
          expect(json_response['id']).to be_an(Integer)
          expect(json_response['name']).to eq("My new list")
        end
      end
    end

    describe '#show' do
      context "when authenticated as a user" do
        before {sign_in(user)}

        it 'should return json with that task list' do
          get :show, id: first_list.id
          expect(json_response).to eq({"id" => first_list.id, "name" => first_list.name, "tasks" => first_list.tasks })
        end

      end
    end
  end

end
