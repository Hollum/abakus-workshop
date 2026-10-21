FROM postgres:18-alpine

ENV POSTGRES_DB=abakus_workshop \
    POSTGRES_USER=abakus

HEALTHCHECK --interval=5s --timeout=5s --start-period=10s --retries=5 \
    CMD pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" || exit 1
