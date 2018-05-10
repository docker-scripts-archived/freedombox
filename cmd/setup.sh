cmd_setup_help() {
    cat <<_EOF
    setup [develop | install]
        Run 'python3 setup.py develop'

_EOF
}

cmd_setup() {
    local mode=${1:-develop}
    ds exec bash -c "cd plinth; python3 setup.py $mode"
}


