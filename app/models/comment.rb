class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def set_post_comments_counter(count)
    self.post.update_attribute 'comments_counter', count
  end
end
