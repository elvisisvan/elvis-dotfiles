[credential "https://github.com"]
	helper = 
	helper = !/data/data/com.termux/files/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = 
	helper = !/data/data/com.termux/files/usr/bin/gh auth git-credential
[user]
	name = Elvis Van
	email = elvisisvan@gmail.com
[safe]
	directory = *
[core]
	editor = nano
	pager = delta
[maintenance]
	repo = /storage/emulated/0/src-elvis/elvis-notes
[init]
	defaultBranch = main
[interactive]
	diffFilter = delta --color-only
[merge]
	conflictstyle = zdiff3
[delta]
	navigate = true
    dark = true
    features = side-by-side line-numbers decorations
    syntax-theme = Dracula
    plus-style = syntax "#003800"
    minus-style = syntax "#3f0001"

[delta "decorations"]
    commit-decoration-style = bold yellow box ul
    file-style = bold yellow ul
    file-decoration-style = none
    hunk-header-decoration-style = cyan box ul

[delta "line-numbers"]
    line-numbers-left-style = cyan
    line-numbers-right-style = cyan
    line-numbers-minus-style = 124
    line-numbers-plus-style = 28

