#!/usr/bin/env bash

URL="$1"

if [ -z "$URL" ]; then
  echo "Usage: $0 <playlist.m3u8 URL>"
  exit 1
fi

# Extract base URL, starting episode, and anime name

BASE=$(echo "$URL" | sed -E 's|/([0-9]+)/playlist.m3u8||')
START_EP=$(echo "$URL" | sed -E 's|.*/([0-9]+)/playlist.m3u8|\1|')
ANIME=$(echo "$BASE" | awk -F/ '{print $NF}')

echo "Anime: $ANIME"
echo "Starting episode detected: $START_EP"

read -p "How many episodes do you want to download? " COUNT

END_EP=$((START_EP + COUNT - 1))

for EP in $(seq $START_EP $END_EP); do
  EP_PAD=$(printf "%02d" $EP)
  PLAYLIST="$BASE/$EP_PAD/playlist.m3u8"
  OUT="${ANIME}-E${EP_PAD}.mp4"

  echo "Downloading episode $EP_PAD..."

  if [ -f "$OUT" ]; then
    echo "$OUT already exists, skipping."
    continue
  fi

  ffmpeg -loglevel error -stats -i "$PLAYLIST" -c copy "$OUT"
done

echo "Done."
