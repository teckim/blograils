require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Index' do
    before(:all) do
      @user = User.first
      @posts = @user.posts
    end

    it 'shows all the properties (title, text, number of comment and likes) of each post' do
      visit user_posts_path(@user)

      @posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
        expect(page).to have_text(post.comments_counter)
        expect(page).to have_text(post.likes_counter)
      end
    end

    it 'shows the user name, photo, and number of posts' do
      visit user_posts_path(@user)

      expect(page).to have_text(@user.name)
      expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
      expect(page).to have_text("#{@user.posts_counter} post") if @user.posts_counter > 0
    end

    it 'shows the first comments on a post' do
      visit user_posts_path(@user)

      comments = @posts[0].last_five_comments

      comments.each do |comment|
        expect(page).to have_text(comment.text)
      end
    end

    it 'redirects to the post show page when clicking the post card' do
      visit user_posts_path(@user)

      post = @posts[0]
      click_on post.title

      expect(page).to have_current_path user_post_path(@user, post)
    end
  end

  describe 'Show' do
    before(:all) do
      @user = User.first
      @post = @user.posts.first
    end

    it 'shows the title' do
      visit user_post_path(@user, @post)

      expect(page).to have_text(@post.title)
    end

    it 'shows the text' do
      visit user_post_path(@user, @post)

      expect(page).to have_text(@post.text)
    end

    it 'shows how many comments it has' do
      visit user_post_path(@user, @post)

      expect(page).to have_text("#{@post.comments_counter} Comment")
    end

    it 'shows how many likes it has' do
      visit user_post_path(@user, @post)

      expect(page).to have_text("#{@post.likes_counter} Like")
    end

    it 'shows the name of the author' do
      visit user_post_path(@user, @post)

      expect(page).to have_text(@user.name)
    end

    it 'shows the comments' do
      visit user_post_path(@user, @post)

      @post.comments.each do |comment|
        expect(page).to have_text(comment.text)
      end
    end

    it 'shows the name of each commentor' do
      visit user_post_path(@user, @post)

      @post.comments.each do |comment|
        expect(page).to have_text(comment.author.name)
      end
    end
  end
end
