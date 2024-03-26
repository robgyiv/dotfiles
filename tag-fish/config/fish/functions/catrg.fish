function catrg
    cat $argv[1] | rg --json -i $argv[2] | delta
end
