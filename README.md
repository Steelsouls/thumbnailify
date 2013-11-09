# Thumbnailify

* * *

A Ruby script to thumbnailify a folder full of images.
Only does present working directory. * Not Recursive *

* * *

## Requirements

* ImageMagick must be installed on your system to make use of the mogrify command!

* * *

## Installation

* Download the script
	`git clone git@github.com:Steelsouls/thumbnailify.git`
* Navigate into the thumbnailify folder
	`cd thumbnailify`
* Make a symbolic link in your bin folder so you can call it from anywhere!
`ln -s thumbnailify.rb ~/bin/thumbnailify`

* * *

## Usage

Once you've made a link in your bin folder, just call `thumbnailify` inside any folder and it'll make a thumbnails folder with 256px, 128px, 64px, and 32px versions of your images inside.
	* Aspect ratios are kept. Pixel dimensions are maximums for each side.
	* Only does your current directory, doesn't search deeper.
