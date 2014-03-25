#!/bin/bash -x

if [ $1 == "pkgs" ] ; then
    # packages:
    sudo apt-get update
    sudo apt-get install python python-pip python-pyparsing python-mysqldb
    sudo apt-get install gunicorn nginx git-core ipython
    # + packages:
    sudo apt-get install pybtex python-suds python-django python-django-south
    sudo apt-get install liblapack-dev libatlas-base-dev
    # pip install django
    sudo pip install numpy
    sudo pip install periodictable

    # mysql: (disable apparmor)
    sudo apt-get install mysql-server mysql-workbench
    sudo mv /etc/apparmor.d/usr.sbin.mysqld /etc/apparmor.d/disable/
    sudo /etc/init.d/apparmor restart

    # git setup:
    git config --global user.name antoniomzrl
    git config --global user.email antonio.mzrl@gmail.com
    git config --global credential.helper 'cache --timeout=28800'

    # get soft:
    # git clone https://github.com/VAMDC/NodeSoftware
    git clone https://github.com/antoniomzrl/NodeSoftware.git
    cd $HOME/NodeSoftware
    git status
    git pull

    # sshd:
    apt-get install openssh-server
    echo Hay que abrir puertas 22, 80 y 8000.
fi



if [ $1 == "test" ] ; then
    python -c "import django"
    python -c "import pyparsing"

    cd nodes/ExampleNode
    ./manage.py
    ./manage.py test
    ./manage.py shell
    #The mysql command we use looks like this:put lines:
    #from node.models import *
    #import vamdctap
    #exit()
fi

UP="-uradamu -pradamp"
UPR="-uroot -pbigbang1"

if [ $1 == "dbinit" ] ; then
    mysql $UPR --verbose <<EOF
    CREATE DATABASE IF NOT EXISTS radamdb;
    CREATE USER radamu IDENTIFIED BY 'radamp';
    GRANT ALL PRIVILEGES ON *.* TO radamu;
    GRANT ALL PRIVILEGES ON *.* TO 'radamu'@'localhost';
    # Problem ERROR 1045:
    SET PASSWORD FOR radamu@localhost=PASSWORD('radamp');
EOF
elif [ $1 == "dbdelete" ] ; then
    mysql $UPR --verbose <<EOF
    DROP DATABASE radamdb;
EOF
elif [ $1 == "dbshow" ] ; then
    mysql $UP --verbose <<EOF
    SELECT USER FROM mysql.user;
    SELECT USER, HOST FROM mysql.user;
    SHOW GRANTS FOR radamu;
    SHOW DATABASES;
EOF
elif [ $1 == "dbschema" ] ; then
    mysql $UP --verbose < dbschema.sql
elif [ $1 == "dbingest" ] ; then
    mysql $UP --verbose < dbingest.sql
fi


if   [ $1 == "testmodels" ] ; then  # Test node/models.py
    ./manage.py sqlall node
elif [ $1 == "models2db" ] ; then   # Create db from node/models.py
    ./manage.py syncdb
elif [ $1 == "db2models" ] ; then   # Create models.py from db
    ./manage.py inspectdb > modelskk.py
elif [ $1 == "runserver" ] ; then
    ./manage.py runserver
fi



if [ $1 == "dbbackup" ] ; then
    mysqldump $UP radamdb > radamdb.bck
    #scp radposdb.bck user@remote.box.com:
elif [ $1 == "dbrestore" ] ; then
    mysql $UP radamdb < radamdb.bck
fi



# ls -l /var/lib/mysql
# GUI:
# mysql-workbench
# Gen fil settings.py
# ./manage.py

# mysql -u radamu -pradamp 
# SHOW TABLES in radamdb;
