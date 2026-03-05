FROM ubuntu:latest
USER root
RUN apt-get update && apt-get install -y curl wget
COPY . /app
EXPOSE 80
CMD ["python", "/app/server.py"]