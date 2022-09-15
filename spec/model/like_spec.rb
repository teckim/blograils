require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { described_class.new }

  it 'Post comments counter can be set' do
    subject.post = Post.new(title: 'Post One', text: 'This is the post one')
    subject.post_likes_counter = 3
    expect(subject.post.likes_counter).to be(3)
  end
end
