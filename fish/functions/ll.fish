function ll --wraps='eza -l --color=always --group-directories-first --icons' --wraps='ls -alF' --description 'alias ll=ls -alF'
    ls -alF $argv
end
