# Thumbnailify

A Ruby script to thumbnailify a folder full of images.
Only does present working directory. * Not Recursive *
* Works on .jpg, .jpeg, and .png

## Requirements

* ImageMagick must be installed on your system to make use of the mogrify command!

## Installation

* Download the script:
	* `git clone git@github.com:Steelsouls/thumbnailify.git`
* Navigate into the thumbnailify directory:
	* `cd thumbnailify`
* Make a symbolic link in your bin directory so you can call it from anywhere!
	* `ln -s thumbnailify.rb ~/bin/thumbnailify`

## Usage

Once you've made a link in your bin directory, just call `thumbnailify` inside any directory and it'll make a thumbnails directory. Inside will be 256px, 128px, 64px, and 32px versions of your images each in their own directory.
* Aspect ratios are kept. Pixel dimensions are maximums for each side.
* Only does your current directory, doesn't search deeper.
