class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :photo, :posts_counter, :email, :role
end
