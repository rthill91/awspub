FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    POETRY_DYNAMIC_VERSIONING_BYPASS=0.0.0

WORKDIR /opt/awspub

COPY pyproject.toml readme.rst LICENSE ./
COPY awspub ./awspub

RUN pip install --upgrade pip \
    && pip install .

WORKDIR /work

ENTRYPOINT ["awspub"]
CMD ["--help"]
