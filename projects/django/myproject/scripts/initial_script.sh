#!/bin/bash

until mysql -h $DB_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -e 'select 1'; do
    echo "MySQL is unavailable - sleeping"
    sleep 1
done

# # sleep 15
# mysql -h $DB_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /app/portal/jobportal_dump.sql
# python3 manage.py makemigrations
# python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8000
