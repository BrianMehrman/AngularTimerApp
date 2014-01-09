class Task < ActiveRecord::Base
  belongs_to :list, class_name: TaskList
  belongs_to :creator, class_name: User

end
