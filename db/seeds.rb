# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
  name: 'Tom Sawyer',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1',
  bio: 'Teacher from Mexico.'
)
User.create(
  name: 'Lily',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1',
  bio: 'Teacher from Poland.'
)
User.create(
  name: 'Pablo Diego Ruiz y Picasso',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1',
  bio: "It is a long established fact that a reader will be distracted by the readable content of a page when
  looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of
  letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop
  publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for
  'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years,
  sometimes by accident, sometimes on purpose (injected humour and the like)."
)
User.create(name: 'Empty')

Post.create(user_id: 1, title: 'Hello', text: 'This is my first post')
Post.create(user_id: 1, title: 'What is Lorem Ipsum?', text: "Lorem Ipsum is simply dummy text of the printing and
  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
  printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with
  the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
  like Aldus PageMaker including versions of Lorem Ipsum.")
Post.create(user_id: 1, title: 'What is Lorem Ipsum?', text: "Lorem Ipsum is simply dummy text of the printing and
  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
  printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with
  the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
  like Aldus PageMaker including versions of Lorem Ipsum.")
Post.create(user_id: 1, title: 'What is Lorem Ipsum?', text: "Lorem Ipsum is simply dummy text of the printing and
  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
  printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with
  the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
  like Aldus PageMaker including versions of Lorem Ipsum.")
Post.create(user_id: 2, title: 'Hello', text: 'This is my first post')
Post.create(user_id: 2, title: 'Hello', text: 'This is my second post')
Post.create(user_id: 2, title: 'Hello', text: 'This is my third post')

Comment.create(post: Post.first, user_id: 2, text: 'Hi Tom!')
Comment.create(post: Post.first, user_id: 3, text: 'Hi Tom!')
Comment.create(post: Post.first, user_id: 4, text: 'Hi Tom!')
