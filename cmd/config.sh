cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    # run standard config scripts
    # ds inject ubuntu-fixes.sh
    ds inject set_prompt.sh
    ds inject install-plinth.sh
}
    # ds inject apache2.sh

