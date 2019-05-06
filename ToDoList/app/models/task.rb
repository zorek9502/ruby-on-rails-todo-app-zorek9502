class Task < ApplicationRecord
  belongs_to :task_list
  validates :description, :task_list_id, presence: true
end
