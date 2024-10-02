# Use an official Ubuntu image as a base
FROM ubuntu:22.04

# Set the working directory
WORKDIR /usr/src/scl

# Install pre-requisite dependencies
RUN apt-get update && apt-get install -y \
    apache2 \
    bash \
    bison \
    flex \
    graphviz \
    gcc \
    g++ \
    lttoolbox \
    make \
    perl \
    python3 \
    python3-pip \
    xsltproc \
    default-jdk \
    ocaml \
    ocamlbuild \
    camlp4 \
    && rm -rf /var/lib/apt/lists/*

# Install required Python packages
RUN pip3 install pandas openpyxl anytree

# Copy your SCL repository into the container
COPY . .

# Run the installation for the SCL tools
RUN ./configure && make && make install

# Enable CGI module for Apache
RUN a2enmod cgid

# Expose the Apache port
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

