class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :created_at, :updated_at, :preview

  has_many :images, if: -> { instance_options[:include_images] }

  def preview
    if object.preview.attached?
      rails_blob_url(object.preview, only_path: true)
    end
  end

  def images
    object.images.map do |image|
      rails_blob_url(image, only_path: true)
    end
  end
end
