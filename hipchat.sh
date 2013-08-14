#!/bin/sh

COLOR="yellow"
ROOM_ID=31226
FROM="Nobody"
NOTIFY=0
MESSAGE_FORMAT="html"
AUTH_TOKEN=""

while getopts "ha:c:f:m:n:r:" opt
do
  case $opt
  in
    h)
      echo "hipchat"
      echo ""
      echo "usage:"
      echo "  -h - This help screen"
      echo "  -a - Authentication token (no default)"
      echo "  -c - Color of notification (default: yellow)"
      echo "  -f - Who to send from (default: Nobody)"
      echo "  -m - Message format (default: html)"
      echo "  -n - Whether to notify channel users (default: 0)"
      echo "  -r - Room id (default: 31226)"
      exit 0
      ;;
    a)
      AUTH_TOKEN=$OPTARG
      ;;
    c)
      COLOR=$OPTARG
      ;;
    f)
      FROM=$OPTARG
      ;;
    m)
      MESSAGE_FORMAT=$OPTARG
      ;;
    n)
      NOTIFY=$OPTARG
      ;;
    r)
      ROOM_ID=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

MESSAGE=`cat`

echo "Sending ${MESSAGE} to room ${ROOM_ID} with auth ${AUTH_TOKEN}"

curl -d "color=${COLOR}&from=${FROM}&message=${MESSAGE}&notify=${NOTIFY}&room_id=${ROOM_ID}" https://api.hipchat.com/v1/rooms/message?auth_token=${AUTH_TOKEN}&format=${MESSAGE_FORMAT}
