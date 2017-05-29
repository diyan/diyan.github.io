.PHONY: watch
.DEFAULT_GOAL := help

get-deps:  ## Install build dependencies
# Arch Linux:
#   $ sudo pacman -S python-watchdog python-markdown python-jinja
#   $ pacaur -S --noedit python-argcomplete
# Generic:
#   $ pip install watchdog markdown jinja2 argcomplete

watch:  ## Re-build presentation on each change
	watchmedo shell-command \
		--patterns="*.md;*.css;*.scss;*.js" \
		--recursive \
		--command='cd scripts/md && python render.py' .

help:  ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'