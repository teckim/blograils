class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def set_post_likes_counter(count)
    self.post.update_attribute 'likes_counter', count
  end
end
