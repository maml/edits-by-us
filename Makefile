CWD=$(shell pwd)
COFFEE=$(CWD)/node_modules/.bin/COFFEE

dev:
	NODE_ENV=development node $(CWD)/start.js

prod:
	NODE_ENV=production node $(CWD)/start.js
