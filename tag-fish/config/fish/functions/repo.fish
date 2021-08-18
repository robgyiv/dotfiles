# https://acroz.dev/2020/07/04/git-find-repos/
function repo
	set initial_query $argv
	set dest (git-find-repos ~/code | fzy -q "$initial_query" -l 20); cd "$HOME/code/$dest"
end
