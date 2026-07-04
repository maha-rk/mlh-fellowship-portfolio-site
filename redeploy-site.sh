#!/bin/bash

tmux kill-server 2>/dev/null

cd ~/mlh-fellowship-portfolio-site

git fetch && git reset origin/main --hard

source python3-virtualenv/bin/activate
pip install -r requirements.txt

tmux new-session -d -s flask_server "cd ~/mlh-fellowship-portfolio-site && source python3-virtualenv/bin/activate && export FLASK_ENV=development && flask run --host=0.0.0.0"
