for NAME in kafka spark flask airflow; do
    docker build -f Dockerfile.${NAME} -t bdfi/${NAME}:2.0 .
done
