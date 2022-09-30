class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :comments_counter, :likes_counter, :author_id

  belongs_to :author, serializer: PostAuthorSerializer, class_name: 'User', foreign_key: 'author_id', type: 'users'
end
