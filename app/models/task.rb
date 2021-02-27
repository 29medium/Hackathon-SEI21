class Task < ApplicationRecord
  belongs_to :user

  enum status: {todo: 0, inprogress: 1, done: 2}
end
