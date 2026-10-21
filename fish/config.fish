if status is-interactive
    set -U fish_greeting ""
    set -gx STARSHIP_CONFIG ~/.config/starship/nora.toml

    starship init fish | source
    fish_config theme choose default


    alias ls="eza --icons=always --group-directories-first"
    alias la="eza --all --icons=always --group-directories-first"
    alias ll="eza --long --all --git --icons=always --group-directories-first"
    alias tree="eza --tree --icons"
    alias dev="nix develop -c fish"
end
