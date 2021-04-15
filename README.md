## Image Downloader
Bash script downloading all images from a given website.

## Requirements
The script requires that `wget` is installed. It should run on both Linux and MacOS.
To install wget:
*	Linux (Ubuntu):

	`sudo apt-get install wget`
*	macOs:

	`brew install wget`

## Usage
To run the script open the terminal, `cd` to its directory and run:

`chmod u+x projekt1.sh`

`./projekt1.sh [URL]`

The downloaded files can be found in the ``./images-[date]/`` directory.

## Description
The script downloads HTML source of the page to a temporary file using `wget`. Then the image tags and image URLS are extracted using `grep`. The duplicate URLS are removed and images are downloaded with `wget`. The temporary file is deleted.
