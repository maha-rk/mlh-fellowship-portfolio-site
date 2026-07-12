#!/bin/bash

BASE_URL="http://localhost:5000/api/timeline_post"

RANDOM_ID=$RANDOM
NAME="TestUser$RANDOM_ID"
EMAIL="testuser$RANDOM_ID@example.com"
CONTENT="This is a random test post number $RANDOM_ID"

echo "== Creating a new timeline post =="
CREATE_RESPONSE=$(curl -s -X POST "$BASE_URL" --data "name=$NAME" --data "email=$EMAIL" --data "content=$CONTENT")
echo "Response: $CREATE_RESPONSE"

POST_ID=$(echo "$CREATE_RESPONSE" | grep -o '"id":[0-9]*' | grep -o '[0-9]*')
echo "Created post with ID: $POST_ID"
echo ""

echo "== Fetching all timeline posts to verify =="
GET_RESPONSE=$(curl -s "$BASE_URL")
echo "Response: $GET_RESPONSE"
echo ""

if echo "$GET_RESPONSE" | grep -q "$CONTENT"; then
  echo "Success: New post found in GET response"
else
  echo "Failure: New post NOT found in GET response"
fi

echo ""
echo "== Deleting the test post (bonus) =="
DELETE_RESPONSE=$(curl -s -X DELETE "$BASE_URL/$POST_ID")
echo "Response: $DELETE_RESPONSE"
