FROM python:3.9.2-alpine3.13

ADD js_example /app_calc/js_example
ADD setup.py MANIFEST.in README.rst /app_calc/

WORKDIR /app_calc

ENV FLASK_APP=js_example

RUN python3 -m venv venv \
&& . venv/bin/activate \
&& pip install -e .

EXPOSE 5000

CMD . /app_calc/venv/bin/activate && flask run -h 0.0.0.0 -p 5000
