from ubuntu

# set work directory
WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt install iproute2 -y
RUN apt install iputils-ping -y
RUN apt install python3.8 -y
RUN apt install python3-pip -y
COPY . .
RUN pip install -r requirements.txt

RUN python3 manage.py migrate
EXPOSE 8000
CMD ["gunicorn"  , "-b", "0.0.0.0:8000", "pollme.wsgi"]
