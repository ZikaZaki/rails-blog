# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all
# Post.destroy_all
# Comment.destroy_all
# Like.destroy_all

# users = User.create([
#     { name: "user1", photo: "https://thispersondoesnotexist.com/image", bio: "I am user1", posts_counter: 0 },
#     { name: "user2", photo: "https://thispersondoesnotexist.com/image", bio: "I am user2", posts_counter: 0 },
#     { name: "user3", photo: "https://thispersondoesnotexist.com/image", bio: "I am user3", posts_counter: 0 },
#     { name: "user4", photo: "https://thispersondoesnotexist.com/image", bio: "I am user4", posts_counter: 0 },
#     { name: "user5", photo: "https://thispersondoesnotexist.com/image", bio: "I am user5", posts_counter: 0 }
# ])

# posts = Post.create([
#     { title: "post1", content: "I am post1", author: users[0], comments_counter: 0, likes_counter: 0 },
#     { title: "post2", content: "I am post2", author: users[0], comments_counter: 0, likes_counter: 0 },
#     { title: "post3", content: "I am post3", author: users[0], comments_counter: 0, likes_counter: 0 },
#     { title: "post4", content: "I am post4", author: users[0], comments_counter: 0, likes_counter: 0 },
#     { title: "post5", content: "I am post5", author: users[1], comments_counter: 0, likes_counter: 0 },
#     { title: "post6", content: "I am post6", author: users[2], comments_counter: 0, likes_counter: 0 },
#     { title: "post7", content: "I am post7", author: users[3], comments_counter: 0, likes_counter: 0 },
#     { title: "post8", content: "I am post8", author: users[4], comments_counter: 0, likes_counter: 0 }
# ])

# comments = Comment.create([
#     { content: "I am comment1", author: users[0], post: posts[0] },
#     { content: "I am comment2", author: users[1], post: posts[0] },
#     { content: "I am comment3", author: users[2], post: posts[0] },
#     { content: "I am comment4", author: users[3], post: posts[0] },
#     { content: "I am comment5", author: users[4], post: posts[0] },
#     { content: "I am comment6", author: users[0], post: posts[0] },
#     { content: "I am comment7", author: users[1], post: posts[1] },
#     { content: "I am comment8", author: users[2], post: posts[2] },
#     { content: "I am comment9", author: users[3], post: posts[3] },
#     { content: "I am comment10", author: users[4], post: posts[4] }
# ])

# likes = Like.create([
#     { author: users[0], post: posts[0] },
#     { author: users[1], post: posts[0] },
#     { author: users[2], post: posts[0] },
#     { author: users[3], post: posts[0] },
#     { author: users[4], post: posts[1] },
#     { author: users[0], post: posts[2] },
#     { author: users[1], post: posts[3] },
#     { author: users[2], post: posts[4] }
# ])

# puts "Seeded #{User.count} users, #{Post.count} posts, #{Comment.count} comments, and #{Like.count} likes."
