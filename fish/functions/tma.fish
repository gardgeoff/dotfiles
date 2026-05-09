function tma --wraps='tmux attach -t' --description 'alias tma=tmux attach -t'
    tmux attach -t $argv
end
