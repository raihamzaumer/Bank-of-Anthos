FROM python:3.14.7-slim@sha256:cad9a2c871761c413caa6fdd6441c783451e740a48aaeba60ae62a8b53525ef6 AS base
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

FROM base AS builder

# Set working directory
WORKDIR /app

# Install dependencies.
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

FROM base

# Set our working directory
WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"

# show python logs as they occur
ENV PYTHONUNBUFFERED=0

# explicitly set a fallback log level in case no log level is defined by Kubernetes
ENV LOG_LEVEL=info

# Add application code.
COPY . .

# Ensure files are readable for non-root users
RUN chmod a+r *

CMD gunicorn -b :$PORT --threads 4 --log-config logging.conf --log-level=$LOG_LEVEL "contacts:create_app()"
