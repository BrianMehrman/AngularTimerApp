FactoryGirl.define do
  factory :user, aliases:[:owner,:creator] do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "secretpassword"

    factory :user_with_tasks do
      ignore do
        tasks_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        list = create(:task_list, owner: user)
        create_list(:task, evaluator.tasks_count, list:list, creator: user)
      end
    end

    factory :user_with_task_lists do
      ignore do
        task_lists_count 5
      end

      after(:create) do |user, evaluator|
        lists = create_list(:task_list, evaluator.task_lists_count, owner:user)
      end
    end
  end

  factory :task_list, aliases:[:list] do
    owner
    sequence(:name) {|n| "Task List #{n}" }
  end

  factory :task do
    list
    creator
    sequence(:description) {|n| "Task #{n}" }
  end
end
