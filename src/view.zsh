view.render() {
    if [[ ! -e $1 ]] {
        echo "Template $1 is not exists."
        return 1
    }
    if [[ -d $1 ]] {
        echo "Template $1 must be a file."
        return 1
    }

    local -A vars=($*[2,-1])
    IFS_bak=$IFS
    IFS="\n"
    while {read -n line} {
        for k v (${(kv)vars}) {
            line=(${line//"{{$k}}"/$v})
        }
        echo $line
    } <$1
    IFS=$IFS_bak
}

view.write() {
    local target=$1
    local content=$2
    >$target < /dev/null
    for line (${(f)content}) {
        echo $line >>$target
    }
}
