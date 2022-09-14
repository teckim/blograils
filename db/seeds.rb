# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

# User seeds
user_1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user_2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

p "Created #{User.count} Users"

# Post seeds
post_1 = Post.create(author: user_1, title: 'Post One', text: 'This is the post one')
post_2 = Post.create(author: user_2, title: 'Post Two', text: 'This is the post two')
post_3 = Post.create(author: user_1, title: 'Post Three', text: 'This is the post three')
post_4 = Post.create(author: user_2, title: 'Post Four', text: 'This is the post four')

p "Created #{Post.count} Posts"

# Comment seeds
Comment.create([
                 { post: post_1, author: user_1, text: 'This is user 1 comment in post 1' },
                 { post: post_2, author: user_2, text: 'This is user 2 comment in post 2' },
                 { post: post_3, author: user_1, text: 'This is user 1 comment in post 3' },
                 { post: post_4, author: user_2, text: 'This is user 2 comment in post 4' },
                 { post: post_1, author: user_1, text: 'This is user 1 comment in post 1' },
                 { post: post_2, author: user_2, text: 'This is user 2 comment in post 2' }
               ])

p "Created #{Comment.count} Comments"

# Like seeds
Like.create([
  { post: post_1, author: user_1 },
  { post: post_2, author: user_2 },
  { post: post_3, author: user_1 },
  { post: post_4, author: user_2 }
])

p "Created #{Like.count} Likes"
