source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

function fish_prompt
    set -l prompt_symbol ' 󰅶'
    fish_is_root_user; and set prompt_symbol ' #'
    set -l vcs (fish_vcs_prompt)

    echo -n (set_color green)$prompt_symbol
    echo -n ' '
    echo -n (set_color blue)(basename (pwd))
    echo -n (set_color green)' '
    echo -n (set_color red)$vcs
    echo
    echo -n (set_color green)'> '(set_color normal)
end

function fish_right_prompt
    echo (set_color blue)(prompt_pwd --full-length-dirs=5)
end
