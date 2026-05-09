function tmk --wraps='tmux kill-session -t' --description 'alias tmk=tmux kill-session -t'
    tmux kill-session -t $argv
end
