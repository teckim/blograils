class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments

  def user_posts_counter=(count)
    author.update_attribute 'posts_counter', count
  end

  def last_five_comments
    comments.last(5)
  end
end
