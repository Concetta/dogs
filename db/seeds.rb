# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#
file = File.read('new_videos.json')

data = JSON.parse(file).with_indifferent_access

videos = data[:items]

videos.each do |video|

  item = video[:snippet]

  Video.create(image_url: item[:thumbnails][:medium][:url],
               published_at: item[:publishedAt],
               title: item[:title],
               description: item[:description],
               youtube_id: video[:id][:videoId]) unless video[:id][:videoId] == nil
end
