# version = "0.109.1"

# basics
$env.config.buffer_editor = "nano"
$env.config.show_banner = false
$env.config.completions.case_sensitive = true

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
starship preset plain-text-symbols -o ~/.config/starship.toml
