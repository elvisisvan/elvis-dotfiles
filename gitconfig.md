[credential "https://github.com"]
	helper = !/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = !/usr/bin/gh auth git-credential
[filter "lfs"]
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
[user]
	name = Elvis Van
	email = elvisisvan@gmail.com
[init]
	defaultBranch = main
[safe]
	directory = *
[maintenance]
	repo = /home/elvis/src-elvis/elvis-notes
	repo = /home/elvis/src-elvis/elvis-bookmarks
