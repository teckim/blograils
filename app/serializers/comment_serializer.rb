class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text

  belongs_to :author, serializer: UserSerializer
  belongs_to :post, serializer: PostSerializer
end
