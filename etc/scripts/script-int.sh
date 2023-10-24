#!/bin/bash

echo ""
echo "**************************************************"
echo "***** Script started"
echo "**************************************************"
echo ""

ENV='int'
PROJ_DIR_INT="/home/consigne.citeo.$ENV.eurelis.info/www"
SYMFONY_DIR='app/'

echo "***** Project directory is $PROJ_DIR_INT, executing task $Tache"
TIME_STAMP=$(date +%Y%m%d-%H%M%S)

SYMFONY_FOLDERS_EXCLUDE=( '/.env.local' '/.env.test' '/var')
for i in "${SYMFONY_FOLDERS_EXCLUDE[@]}"
do
    SYMFONY_FOLDERS_EXCLUDE_OPS+=( --exclude="${i}" )
done

synchronize() {
    . $HOME/.bashrc
    echo "***** Sync site "

    echo "Sync BACK ..."
    rsync -avvh --delete ${SYMFONY_FOLDERS_EXCLUDE_OPS[@]} ${SYMFONY_DIR} ${PROJ_DIR_INT}


    cd ${PROJ_DIR_INT}

    echo "***** Composer install "
    composer --no-dev --optimize-autoloader --no-interaction install

    echo "***** End of Synchronizing"
    cd -
}

dump() {
    echo "***** Dump DB"
    if [ ! -d '_dump' ]
    then
        echo "> Creating _dump directory"
        mkdir '_dump'
    fi
    cd _dump
    filename=dump.$ENV-$TIME_STAMP.sql
    echo "> Dumping database"
    mysqldump $DB_NAME -u $DB_USER -p$DB_PASSWORD > $filename
    echo "> Zipping dump file"
    gzip $filename
    cd -
}

update() {
    echo "***** Updating task"
    synchronize

    cd $PROJ_DIR_INT
    echo "Make actions"
    make varm_up_eurelis
    make cache
    make update
    cd -
}

maintenanceOn() {
    echo "***** Mode maintenance ON"
    cd $PROJ_DIR_INT
    echo "Make actions"
    make maintenance_on
    cd -
}

maintenanceOff() {
    echo "***** Mode maintenance OFF"
    cd $PROJ_DIR_INT
    echo "Make actions"
    make maintenance_off
    cd -
}

case $Tache in
'update')
    update
;;
'maintenance-on')
    maintenanceOn
;;
'maintenance-off')
    maintenanceOff
;;
'backup')
    dump
;;
esac