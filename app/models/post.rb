class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    belongs_to :user
    has_many :responses, dependent: :destroy
end
