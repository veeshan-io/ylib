
func.ex() {
    if [[ $(which $1) != *" not found" ]] {
        echo 1
    }
}
