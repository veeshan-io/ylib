user.exist() {
    id $1 >& /dev/null
    if [[ $? -ne 0 ]] {
        echo no
        return
    }
    echo yes
}

