file.insert_before() {
    IFS_bak=$IFS
    IFS="\n"
    while {read line} {
        if (($line[(I)$2])) {
            for insert ($*[3,-1]) {
                echo $insert
            }
        }

        echo $line
    } <$1
    IFS=$IFS_bak
}

file.include() {
    IFS_bak=$IFS
    IFS="\n"
    while {read line} {
        if (($line[(I)$2])) {
            echo yes
            IFS=$IFS_bak
            return
        }
    } <$1
    IFS=$IFS_bak
    echo no
}

file.write() {
    local target=$1
    local content=$2

    >$target < /dev/null
    for line (${(f)content}) {
        echo -ne "$line\n" >>$target
    }
}

file.backup() {
    [[ ! -e $1.bak ]] && cp $1 $1.bak
}

file.per_line() {
    IFS_bak=$IFS
    IFS="\n"
    while {read line} {
        echo $line
    } <$1
    IFS=$IFS_bak
}