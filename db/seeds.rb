# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

tag_names = [
  'Информационные технологии', 'Информационная безопасность', 'Маркетинг',
  'Финансы', 'Философия', 'Психология', 'Спорт', 'Отношения', 'Музыка'
]

tag_names.each { |tag_name| Tag.create(name: tag_name) }
tag_ids = Tag.ids

title = Faker::Movies::StarWars.method(:quote)
images = ['public/seeds/img1.jpg', 'public/seeds/img2.jpg', 'public/seeds/img3.jpg', 'public/seeds/img4.jpg',
          'public/seeds/img5.jpg', 'public/seeds/img6.jpg', 'public/seeds/img7.jpg']
# topic.image = File.open(image_path)
# topic.save

url_paths = ['super/news/here', 'very/important', 'do/not/miss', 'hard/part/here']
announce = Faker::Quote.method(:yoda)
text = Faker::Movies::StarWars.method(:quote)
published = [false, true]
published_at = Time.now

100.times do |i|
  topic_tag_ids = []
  (0..tag_names.count).to_a.sample.times { topic_tag_ids << (tag_ids - topic_tag_ids).sample }
  Topic.create(
    title: title.call,
    image: File.open(images.sample),
    url_path: url_paths.sample,
    announce: announce.call,
    text: "#{text.call} #{text.call} #{text.call} #{text.call} #{text.call}",
    published_at: published_at - i.minutes,
    published: published.sample,
    tag_ids: topic_tag_ids
  )
end
