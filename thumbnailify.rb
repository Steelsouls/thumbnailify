#!/usr/bin/env ruby

# Ruby script to thumbnailify a folder full of images.
# Only does present working directory. * Not Recursive *

# * * * * * * * * * * * * * * * * * * * * * *
# ImageMagick must be installed on your
# system to make use of the mogrify command!
# * * * * * * * * * * * * * * * * * * * * * *

require 'find'

present_dir = Dir.pwd
images = []

thumbnail_top_dir = File.join(present_dir, "thumbnails")
Dir.mkdir(thumbnail_top_dir) unless Dir.exists?(thumbnail_top_dir)

Find.find(present_dir) do |path|
  next if path == present_dir
  Find.prune if File.directory?(path)
  if File.basename(path) =~ /jpe?g/i
    images << path
  end
end

thumbnail_dirs = {}
thumbnail_dirs[256] = File.join(present_dir,"thumbnails" ,"256px")
thumbnail_dirs[128] = File.join(present_dir,"thumbnails" ,"128px")
thumbnail_dirs[64] = File.join(present_dir,"thumbnails" ,"64px")
thumbnail_dirs[32] = File.join(present_dir,"thumbnails" ,"32px")

thumbnail_dirs.each do |size, thumb_dir|
  puts "Creating #{size}px thumbnails..."
  Dir.mkdir(thumb_dir) unless Dir.exists?(thumb_dir)
  images.each do |image|
    `mogrify -path #{thumb_dir} -resize #{size}x#{size} -quality 100 #{image}`
  end

end
