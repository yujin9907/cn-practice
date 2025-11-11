FROM python:3.11.2
WORKDIR /usr/src/app

# 의존성만 먼저 복사 → 캐시 활용
COPY . .
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR ./myapp
CMD gunicorn main:app --bind 0.0.0.0:8001
EXPOSE 8001
