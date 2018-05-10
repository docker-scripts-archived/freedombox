cmd_setup_help() {
    cat <<_EOF
    setup [develop | install | test [-s ...]]
        Run 'python3 setup.py ...'

_EOF
}

cmd_setup() {
    ds exec bash -c "cd plinth; python3 setup.py $@"
}


