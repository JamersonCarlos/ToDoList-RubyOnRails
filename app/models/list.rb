class List < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, presence: true, length: { minimum: 1, message: "Title cannot be empty" }
end
