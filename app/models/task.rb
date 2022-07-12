class Task < ApplicationRecord
    belongs_to :category
    validates :description, presence:true
    validates :deadline, presence:true
    validates :category_id, presence:true
    validates :name, presence:true
end
