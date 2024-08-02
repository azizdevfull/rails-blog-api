class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :image

  def image
    if object.image.attached?
      rails_blob_url(object.image, only_path: false)
    end
  end
end
