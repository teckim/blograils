require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Index' do
    before(:all) do
      @users = User.limit(5)
    end

    it 'shows all the properties (name, photo, number of posts) of each user' do
      visit users_path

      @users.each do |user|
        expect(page).to have_text(user.name)
        expect(page).to have_css("img[src*=\"#{user.photo}\"]")
        expect(page).to have_text(user.posts_counter)
        expect(page).to have_link(href: user_path(user))
      end
    end

    it 'redirects to user show page when clicking the user card' do
      visit users_path

      user = @users[0]
      click_on user.name

      expect(page).to have_current_path user_path(user)
    end
  end

  describe 'Show' do
    before(:all) do
      @user = User.first
    end

    it 'shows the name' do
      visit(user_path(@user))

      expect(page).to have_content(@user.name)
    end

    it 'shows the profile picture' do
      visit(user_path(@user))

      expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
    end

    it 'shows the bio' do
      visit(user_path(@user))

      expect(page).to have_text(@user.bio)
    end

    it 'shows a link to create a new post' do
      visit(user_path(@user))

      expect(page).to have_link(href: new_post_path)
    end

    it 'shows the last three posts' do
      visit(user_path(@user))

      @user.last_three_posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
        expect(page).to have_link(href: user_post_path(@user.id, post.id))
      end
    end

    it 'should have a link to see all the posts' do
      visit(user_path(@user))

      expect(page).to have_link(href: user_posts_path(@user))
    end

    it 'redirects to the user posts page when clicking on see all posts' do
      visit(user_path(@user))

      click_on 'See all posts'

      expect(page).to have_current_path user_posts_path(@user)
    end

    it 'redirects to the post show page when clicking the post card' do
      visit(user_path(@user))

      post = @user.last_three_posts[0]
      click_on post.title

      expect(page).to have_current_path user_post_path(@user, post)
    end
  end
end
