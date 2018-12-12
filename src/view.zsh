view.render() {
    if [[ ! -e $1 ]] {
        echo "Template $1 is not exists."
        exit
    }
    if [[ -d $1 ]] {
        echo "Template $1 must be a file."
        exit
    }

    local -A vars=($*[2,-1])
    while {read line} {
        for k v (${(kv)vars}) {
            line=(${line//"{{$k}}"/$v})
        }
        echo $line
    } <$1
}

view.write() {
    local target=$1
    local content=$2
    >$target < /dev/null
    for line (${(f)content}) {
        echo $line >>$target
    }
}
