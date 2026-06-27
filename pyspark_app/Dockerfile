FROM python:3.12-slim



# Crucial: Set the JAVA_HOME environment variable so PySpark can find the JVM
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH="${PYTHONPATH}:/app/src/"
WORKDIR /app

# ADD . /app
RUN apt-get update && \
    mkdir -p /usr/share/man/man1 /usr/share/man/man2 && \
    apt-get install -y --no-install-recommends openjdk-17-jdk-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    #    openjdk-17-jre-headless \
    #    curl \
    # && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt

# CMD ["fastapi", "dev", "/app/src/api/api.py"]