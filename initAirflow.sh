#!/usr/bin/bash
airflow db init 
airflow users create --username admin --firstname Rodrigo --lastname  Escudero --role Admin --email example@mail.org --password 1234 