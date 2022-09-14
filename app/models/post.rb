class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  
  def set_user_posts_counter(count)
    self.author.update_attribute 'posts_counter', count
  end

  def get_last_five_comments
    self.comments.last(5)
  end
end
