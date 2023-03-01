FROM ubuntu

RUN mkdir -p /opt/projects /opt/projects/data

RUN apt-get update 
RUN apt-get -y install \ 
    openjdk-8-jre-headless \ 
    g++ \ 
	python3.11 \ 
	python3-pip \ 
	libopenblas-base \ 
	liblapack3 \
    curl \
    apt-utils
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - 
RUN apt-get install -y nodejs 
RUN pip install \ 
    jupyterlab \ 
    jupyterlab-lsp \ 
    jedi-language-server \ 
    python-lsp-server \ 
    hail 
EXPOSE 8888
WORKDIR /opt/projects
CMD jupyter-lab \
    --ip 0.0.0.0 \
    --port 8888 \
    --no-browser \
    --allow-root
