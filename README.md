# Thumbnailify

A Ruby script to thumbnailify a folder full of images.
Only does present working directory. * Not Recursive *
* Works on .jpg, .jpeg, and .png

## Requirements

* ImageMagick must be installed on your system to make use of the mogrify command!

## Installation

1. Download the script:
	* `git clone git@github.com:Steelsouls/thumbnailify.git`
2. Navigate into the thumbnailify directory:
	* `cd thumbnailify`
3. Make a symbolic link in your bin directory so you can call it from anywhere!
	* `ln -s thumbnailify.rb ~/bin/thumbnailify`
	* If preferred, skip this and move/copy the script into your bin instead.

## Usage

Once you've made a link in your ~/bin, just call `thumbnailify` from anywhere and it'll make a thumbnails directory. Inside will be copies of all images from your current directory in 256px, 128px, 64px, and 32px sizes.
* Aspect ratios are kept.
* Pixel dimensions are maximums for each side.
* Only looks in your current directory, doesn't search deeper.
