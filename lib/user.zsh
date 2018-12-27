user.exist() {
    id $user >& /dev/null
    if [[ $? -ne 0 ]] {
        echo no
        return
    }
    echo yes
}

