function logseq-push
  if test "$PWD" = "/Users/robbie/code/github.com/logseq-work"
    git add .
    git commit -m "Auto save"
    git push origin master
	end
end
