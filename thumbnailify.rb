#!/usr/bin/env ruby

# Ruby script to thumbnailify a folder full of images (jpg, jpeg, or png).
# Only does present working directory. * Not Recursive *

# * * * * * * * * * * * * * * * * * * * * * *
# ImageMagick must be installed on your
# system to make use of the mogrify command!
# * * * * * * * * * * * * * * * * * * * * * *

require 'find'

present_dir = Dir.pwd
images = []

# Parse sizes or set defaults if none given
if ARGV.empty?
  sizes = [256, 128, 64, 32]
else
  sizes = ARGV.map { |num| num.to_i }
  sizes.reject! { |num| num == 0 }
end

# Make directory called thumbnails unless it exists
thumbnail_top_dir = File.join(present_dir, "thumbnails")
Dir.mkdir(thumbnail_top_dir) unless Dir.exists?(thumbnail_top_dir)

# Make a subdirectory in thumbnails/ for each size
thumbnail_dirs = {}
sizes.each do |num|
  thumbnail_dirs[num] = File.join(present_dir, "thumbnails", "#{num}px")
end

# Find images
Find.find(present_dir) do |path|
  next if path == present_dir
  Find.prune if File.directory?(path)
  images << path if File.basename(path) =~ /jpe?g/i
  images << path if File.basename(path) =~ /png/i
end

# Create thumbnails
thumbnail_dirs.each do |size, thumb_dir|
  puts "Creating #{size}px thumbnails..."
  Dir.mkdir(thumb_dir) unless Dir.exists?(thumb_dir)
  images.each do |image|
    `mogrify -path #{thumb_dir} -resize #{size}x#{size} -quality 100 #{image}`
  end

end
