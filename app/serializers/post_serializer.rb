class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :images, :created_at, :updated_at
end
