#!/bin/bash

# pip install markdown jinja2 argcomplete watchdog

watchmedo shell-command --patterns="*.md;*.css;*.scss;*.js" --recursive --command='cd scripts/md && python render.py' .
