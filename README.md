# Prueba-Final

Las mejoras que se han desarrollado son: 
- Ejecución del job de prediición con Spark-submit.
- Dockerizar cada uno de los servicios que componene la arquitectura.
- Despliegue del escenario usando Docker Compose.
- Entrenamiento del modelo con Apache Airflow.
- Despliegue del escenario en Google Cloud.

# Versiones que se están utilizando:
- Docker version: 20.10.7
- docker-compose version: 1.27.4

# Pasos a seguir para la reproducción del escenario con docker-compose/docker:

## 1.Clonar este repositorio y construir .tgzs de kafka y spark con las versiones propuestas.

- cd Examen
- Ejecutar script: bash buildTgzs.sh

Con tree -L 1 se debería alcanzar la siguiente estructura:

![Selección_004](https://user-images.githubusercontent.com/94795264/142773618-b86e0c9b-4acf-4e23-b2bc-428512827208.png)
    
## 2. Construir las imagenes.
  - Ejecutar el script de configuración: bash buildAllDockers.sh

## 3. Levantar el servicio.
  - Una vez creadas las imagenes, se ejecuta el script orders.sh que levanta el servicio y hace que airflow baje los datos necesarios para el entrenamiento y mongo importa los datos en la base de datos.

Hasta ahora tenemos el escenario levantado (spark está esperando a que el modelo esté entrenado). Para ello, es necesario entrar en airflow y lanzar el DAG.

## 4. Entrenar el modelo con Airflow:
 En http://localhost:8080/home, aparecerá el interfaz de login de airflow:
  - Usuario: _"admin"_
  - Contraseña: _"1234"_
  
  Una vez dentro, ejecutar el DAG. (Tarda un poco, se recomienda chequear el estatus en el tree view)
 
## 5.Hacer predicciones.

  Finalmente y una vez que haya acabado el DAG spark ya estará listo y se podrán hacer predicciones, para ello, entra en:  http://localhost:5000/flights/delays/predict_kafka
  
  _Nota: para detener el escenario se proporciona el script stopAll.sh_
# Despliegue del escenario en Google Cloud:

1. Crear una máquina con Ubuntu 20.04.
2. Instalado docker y docker-compose.
3. Configurar las reglas del firewall.
   - Exponer los puertos _8080_ (Airflow) y _5000_ (Flask).
   - Permitir el tráfico entrante (la dirección IP pública con la que quiera acceder a Airflow y a Flask).
4. Desplegar el servicio como en el apartado anterior.
