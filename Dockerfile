FROM python:3.11.2
WORKDIR /usr/src/app

# 의존성만 먼저 복사 → 캐시 활용
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# 실제 앱 코드 복사
COPY myapp ./myapp

WORKDIR ./myapp
CMD gunicorn main:app --bind 0.0.0.0:8001
EXPOSE 8001
