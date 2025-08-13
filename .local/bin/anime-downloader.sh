#!/bin/sh

# request the url as $1, warning message and exit if not present

if [ -z "$1" ]; then
  echo "No URL provided. Usage: $0 <url>"
  exit 1
fi

# check if there is the @episode placeholder
if echo "$1" | grep -vq "@episode"; then
  echo "URL must contain the @episode tag to be replaced with the number of episode."
  exit 1
fi

url=$1

# request starting episode
echo "Enter the starting episode number:"
read start_episode

# request ending episode
echo "Enter the ending episode number:"
read end_episode

for i in $(seq $start_episode $end_episode)
do

  # add leading 0 if i < 10
  if [ $i -lt 10 ]; then
    i="0$i"
  fi

  # replace "@episode" with the actual episode number
  download_url=${url//@episode/$i}
  echo "Downloading episode $i from $download_url"
  wget $download_url
done
