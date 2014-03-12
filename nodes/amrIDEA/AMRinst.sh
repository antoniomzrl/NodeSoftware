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



if [ $1 == "dbinit" ] ; then
    mysql -u root -p --verbose < dbinit.sql
elif [ $1 == "dbschema" ] ; then
    mysql -u radamu -pradamp --verbose < dbschema.sql
elif [ $1 == "dbingest" ] ; then
    mysql -u radamu -pradamp --verbose < dbingest.sql
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
    mysqldump -u radamu -pradamp radamdb > radamdb.bck
    #scp radposdb.bck user@remote.box.com:
elif [ $1 == "dbrestore" ] ; then
    mysql -u radamu -pradamp radamdb < radamdb.bck
fi



# ls -l /var/lib/mysql
# GUI:
# mysql-workbench
# Gen fil settings.py
# ./manage.py

# mysql -u radamu -pradamp 
# SHOW TABLES in radamdb;
