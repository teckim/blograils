require 'rails_helper'

describe 'the user views:', type: :feature do
  it 'renders the users list view' do
    visit '/users'

    expect(current_path).to eq(users_path)
    expect(page).to have_text('Users list')
  end

  it 'renders the user details view' do
    visit '/users/1'

    expect(current_path).to eq('/users/1')
    expect(page).to have_text('User details')
  end
end
