# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tag_names = [
  'Информационные технологии', 'Информационная безопасность', 'Маркетинг',
  'Финансы', 'Философия', 'Психология', 'Спорт', 'Отношения', 'Музыка'
]

tag_names.each { |tag_name| Tag.create(name: tag_name) }
tag_ids = Tag.ids

title = Faker::Movies::StarWars.method(:quote)
images = ['app/assets/images/seeds/img1.jpg', 'app/assets/images/seeds/img2.jpg', 'app/assets/images/seeds/img3.jpg', 'app/assets/images/seeds/img4.jpg',
          'app/assets/images/seeds/img5.jpg', 'app/assets/images/seeds/img6.jpg', 'app/assets/images/seeds/img7.jpg']
# topic.image = File.open(image_path)
# topic.save

url_paths = ['super/news/here', 'very/important', 'do/not/miss', 'hard/part/here']
announce = Faker::Quote.method(:yoda)
text = Faker::Movies::StarWars.method(:quote)
published = [false, true]
published_at = Time.now

300.times do |i|
  topic_tag_ids = []
  (0..4).to_a.sample.times { topic_tag_ids << (tag_ids - topic_tag_ids).sample }
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
