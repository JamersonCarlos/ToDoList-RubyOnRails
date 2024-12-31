class Task < ApplicationRecord
    belongs_to :list
    validates :title, presence: true, length: { minimum: 1, message: "Title cannot be empty" }
end
