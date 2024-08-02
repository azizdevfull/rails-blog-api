class PostSerializer < ActiveModel::Serializer

  attributes :id, :title, :body, :created_at, :updated_at # Add other attributes as needed

  has_many :images

  def images
    object.images.map do |image|
      Rails.application.routes.url_helpers.url_for(image)
    end
  end
end
