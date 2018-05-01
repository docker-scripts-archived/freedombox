cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    # run standard config scripts
    ds inject debian-fixes.sh
    ds inject install-plinth.sh
    ds restart
    # ds exec ``


}


