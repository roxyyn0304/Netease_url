# Source: https://github.com/roxyyn0304/Netease_url
FROM python:3.11-alpine3.19
WORKDIR /app
RUN apk add --no-cache ffmpeg
COPY requirements.txt requirements.txt
RUN pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
    pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x /app/entrypoint.sh
ENV TZ=Asia/Shanghai
LABEL org.opencontainers.image.source="https://github.com/roxyyn0304/Netease_url"
EXPOSE 5000
CMD ["/app/entrypoint.sh"]
