require 'spec_helper'

describe Task do
  context "for a new valid task" do
    let(:creator) { create(:user)}
    let(:list) { create(:task_list, owner: creator)}
    let(:task) { create(:task, list: list, creator: creator)}

    it "should have a creator" do
      task.creator.should == creator
    end

    it "should have a task list" do
      task.list.should == list
    end
  end
end
