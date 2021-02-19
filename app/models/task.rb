class Task < ApplicationRecord
  belongs_to :user
   validates :name, presence: true
   validates :task_details, length: { maximum: 50 }
end
