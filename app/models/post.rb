class Post < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :user
  has_one_attached :preview
  has_many_attached :images
end
