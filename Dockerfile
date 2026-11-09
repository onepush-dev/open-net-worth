# Open Net Worth on Railway: the official image (ghcr.io/open-net-worth-ai/open-net-worth:0.1.43,
# AGPL-3.0), app unmodified, plus a small start script:
#   - Railway mounts volumes root-owned, so it hands /home/onw (the one volume: ledger data,
#     caches, logs, backups and the Claude/Codex/OpenCode CLI sign-ins) to the image's onw user
#     (uid 1000) and drops to it;
#   - listens dual-stack on $PORT.
# AUTH_PASSWORD (generated per deploy by the template) seeds the instance password on first boot.
FROM ghcr.io/open-net-worth-ai/open-net-worth:0.1.43@sha256:0eddd2f870b00b6839ad98d5d80b1d0ebcf3ec53a6da0e6d7d7c68191518a51b
USER root
COPY railway/start.sh /usr/local/bin/onw-railway-start
RUN chmod 755 /usr/local/bin/onw-railway-start
ENV HOST=:: \
    PORT=8080 \
    AUTH_TRUST_LOOPBACK=false
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/onw-railway-start"]
CMD ["python3", "-m", "backend.main"]
