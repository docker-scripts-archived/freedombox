cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    ds inject debian-fixes.sh
    ds inject ssmtp.sh

    ds inject freedombox-setup.sh
    ds inject fix-django-problem.sh
    ds restart
}


