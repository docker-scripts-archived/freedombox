cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    ds inject debian-fixes.sh
    ds inject ssmtp.sh

    [[ -d plinth ]] \
        || git clone https://salsa.debian.org/freedombox-team/plinth

    ds inject fix-django-problem.sh
    ds setup
    ds inject install-dependencies.sh

    ds restart
}


