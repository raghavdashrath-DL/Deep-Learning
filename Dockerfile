# Stage 1 : Build

FROM python:3.9-slim as Builder
# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc python3-dev && \
    rm -rf /var/lib/lists

# install python dependencies
COPY req_prod.txt .
RUN pip install --user -r req_prod.txt

# Stage 2 : Final Image
FROM python:3.9-slim

WORKDIR /app

# Copy only necessary files from the previous image OR builder stage
COPY --from=Builder /root/.local /root/.local
COPY . .

# set environment variables
ENV PATH=/root/.local/bin:$PATH
ENV STREAMLIT_SERVER_PORT=8501

# Expose the port 
EXPOSE 8501

# Run the application
CMD ["streamlit", "run", "app.py" , "--server.port=8501" , "--server.address=0.0.0.0"]

