#!/bin/bash -x

if [ $1 == "preinst" ] ; then
   # packages:
   sudo apt-get update
   sudo apt-get install python python-pip python-pyparsing python-mysqldb gunicorn nginx git-core ipython
   # + packages:
   sudo apt-get install mysql-server liblapack-dev libatlas-base-dev
   sudo apt-get install pybtex python-suds python-django python-django-south
   # pip install django
   sudo pip install numpy
   sudo pip install periodictable
   # periodictable (no .deb):
   #cd $HOME/NodeSoftware/periodictable-1.3.9
   #python setup.py
fi

if [ $1 == "gitsetup" ] ; then
   git config --global user.name antoniomzrl
   git config --global user.email antonio.mzrl@gmail.com
   git config --global credential.helper 'cache --timeout=28800'
   # get soft:
   # git clone https://github.com/VAMDC/NodeSoftware
   git clone https://github.com/antoniomzrl/NodeSoftware.git
   cd $HOME/NodeSoftware
   git status
   git pull
fi

if [ $1 == "test" ] ; then
   python -c "import django"
   python -c "import pyparsing"

   cd nodes/ExampleNode
   ./manage.py
   ./manage.py test
   ./manage.py shell
   #The mysql command we use looks like this:put lines:
   from node.models import *
   import vamdctap
   exit()
fi

if [ $1 == "dbinit" ] ; then
   mysql -u root -p --verbose < initdb.sql
fi

if [ $1 == "dbingest" ] ; then
   mysql -u root -p --verbose < ingesta.sql
fi
 
# ls -l /var/lib/mysql
# GUI:
# mysql-workbench
# Gen fil settings.py
# ./manage.py

# mysql -u radamu -pradamp 
# SHOW TABLES in radamdb;


if [ $1 == "dbbck" ] ; then
   mysqldump -u radamu -pradamp radamdb > radamdb.bck
   #scp radposdb.bck user@remote.box.com:
fi
if [ $1 == "dbrestore" ] ; then
   mysql -u radamu -pradamp radamdb < radamdb.bck
fi


# Disable apparmor mysql:
sudo mv /etc/apparmor.d/usr.sbin.mysqld /etc/apparmor.d/disable/
sudo /etc/init.d/apparmor restart

# create database / tables:
./manage.py sqlall node
./manage.py syncdb




