class Post < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :user
  has_many_attached :images
end
