# Use the official TensorFlow image as a base image
FROM tensorflow/tensorflow:latest

# Set environment variables for Jupyter Notebook
ENV JUPYTER_PORT 8888
ENV JUPYTER_PASSWORD jupyter  # Change this to your desired password

# Create a directory for your Jupyter notebooks
RUN mkdir /notebooks

# Set the working directory
WORKDIR /notebooks

# COPY file
COPY requirements.txt /notebooks

# Install additional packages and libraries
RUN apt-get update \
    && apt-get install -y python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Expose the Jupyter Notebook port
EXPOSE $JUPYTER_PORT

# Start Jupyter Notebook when the container runs
CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root" ]     