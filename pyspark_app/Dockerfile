FROM apache/spark-py

USER root

# Crucial: Set the JAVA_HOME environment variable so PySpark can find the JVM
# ENV JAVA_HOME=/usr/lib/jvm/default-java
# ENV PATH=$JAVA_HOME/bin:$PATH
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH="${PYTHONPATH}:/app/src/"
ADD . /app
WORKDIR /app


RUN apt-get update && apt-get install -y nano
#     mkdir -p /usr/share/man/man1 /usr/share/man/man2 && \
#     apt-get install -y --no-install-recommends openjdk-21-jdk-headless && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
    #    openjdk-17-jre-headless \
    #    curl \
    # && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt

# CMD ["fastapi", "dev", "/app/src/api/api.py"]