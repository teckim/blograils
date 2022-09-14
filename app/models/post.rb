class Post < ApplicationRecord
  include ActiveModel::API

  belongs_to :users
end
