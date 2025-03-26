# Stage 1 : Build

FROM python:3.9-slim as Builder
# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc python3-dev && \
    rm -rf /var/lib/lists

# install python dependencies
COPY req_prod.txt .
RUN pip install --user -r req_prod.txt
