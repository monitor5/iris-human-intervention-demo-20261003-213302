FROM python:3.12-slim
WORKDIR /app
COPY app.py verify_release.py trusted_approval.sha256 release_approval.txt ./
RUN python -m py_compile app.py verify_release.py
RUN python verify_release.py
USER 10001
EXPOSE 8080
CMD ["python", "app.py"]
