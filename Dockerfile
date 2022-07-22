FROM python:3.11.0b4-alpine3.16

#RUN apk --update add py-django
# RUN apk add py-django

COPY ./requirements.txt /sf23/requirements.txt

RUN pip install --upgrade pip
 
WORKDIR /sf23

RUN pip install -r requirements.txt

COPY ./sf23 /sf23

RUN python manage.py migrate --no-input && python manage.py collectstatic --no-input

CMD [ "gunicorn","sf23.wsgi:application", "--bind", "0.0.0.0:8000" ]

# RUN gunicorn sf23.wsgi:application --bind 0.0.0.0:8000