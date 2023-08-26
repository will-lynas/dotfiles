BACKUP_ROOT="${HOME}/.config_backups/"

backup_dir_from_n () {
    echo "${BACKUP_ROOT}/backup_$(printf "%04d" $n)"
}

mkdir -p $BACKUP_ROOT
n=0
while [[ -d $(backup_dir_from_n $n) ]] ; do
    n=$(($n+1))
done
BACKUP_DIR=$(backup_dir_from_n $n)
mkdir -p "${BACKUP_DIR}"

backup_rm () {
    mv "$1" "${BACKUP_DIR}"
}
