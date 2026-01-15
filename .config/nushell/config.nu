# version = "0.109.1"

$env.config.buffer_editor = "nano"
$env.config.show_banner = false
$env.config.completions.case_sensitive = true

def create_left_prompt [] {
    let host = (hostname | str trim)
    let dir = ($env.PWD | str replace $nu.home-path '~')
    $"(ansi green)($host)(ansi reset) at (ansi cyan)($dir)(ansi reset)"
}

def create_right_prompt [] {
    if ($env.CMD_DURATION_MS? != null) {
        let dur = ($env.CMD_DURATION_MS | into int) * 1ms
        $"(ansi yellow)($dur)(ansi reset) "
    } else { "" }
}

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { || create_right_prompt }
$env.PROMPT_INDICATOR = { || "> " }
