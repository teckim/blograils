require 'rails_helper'

describe 'the post views:', type: :feature do
  it 'renders the posts list view' do
    visit '/users/1/posts'

    expect(current_path).to eq('/users/1/posts')
    expect(page).to have_text('User posts list')
  end

  it 'renders the post details view' do
    visit '/users/1/posts/1'

    expect(current_path).to eq('/users/1/posts/1')
    expect(page).to have_text('User post details')
  end
end
