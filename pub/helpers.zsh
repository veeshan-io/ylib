pl() {
    print -l $*
}

touch_local() {
    if [[ ! -e ~/local/bin ]] {
        mkdir -p /local/bin
    }
}