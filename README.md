# Sahab-Agents — Odoo 19

A production-ready **Odoo 19** deployment on [Railway](https://railway.app), built on the official `odoo:19` Docker image with support for custom addons.

---

## Architecture

```
Sahab-Agents/
├── Dockerfile          # Extends the official odoo:19 image
├── odoo.conf           # Odoo server configuration (DB, ports, logging)
├── addons/             # Custom Odoo modules (copied to /mnt/extra-addons/)
│   ├── __init__.py
│   └── README.md
└── .gitignore
```

> **Note:** The Odoo 19 core source code is provided by the official [`odoo:19`](https://hub.docker.com/_/odoo) Docker image — it does not need to live in this repository. Only your **custom addons** belong here.

---

## How It Works

1. **Base image** — `FROM odoo:19` pulls the official Odoo 19 image which includes the full Odoo framework, all standard modules, and all system dependencies.
2. **Custom addons** — The `addons/` directory is copied into `/mnt/extra-addons/` inside the container. Any Python dependencies listed in `addons/requirements.txt` are installed automatically.
3. **Configuration** — `odoo.conf` is copied to `/etc/odoo/odoo.conf`. Database credentials are injected at runtime via Railway environment variables (`DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`).

---

## Adding a Custom Module

1. Create a new directory under `addons/`:
   ```
   addons/
   └── my_module/
       ├── __init__.py
       ├── __manifest__.py
       ├── models/
       │   └── __init__.py
       └── views/
   ```
2. Commit and push — Railway will rebuild and redeploy automatically.

---

## Environment Variables (Railway)

| Variable      | Description                                      |
|---------------|--------------------------------------------------|
| `DB_HOST`     | PostgreSQL host (set by Railway Postgres plugin) |
| `DB_PORT`     | PostgreSQL port (default: `5432`)                |
| `DB_USER`     | PostgreSQL username                              |
| `DB_PASSWORD` | PostgreSQL password                              |
| `DB_NAME`     | Database name (default: `odoo`)                  |

---

## Local Development

```bash
# 1. Clone the repo
git clone https://github.com/sahab-ai-hub/Sahab-Agents.git
cd Sahab-Agents

# 2. Start Odoo + Postgres with Docker Compose (optional)
docker compose up

# 3. Access Odoo at http://localhost:8069
```

---

## References

- [Odoo 19 Docker Hub](https://hub.docker.com/_/odoo)
- [Odoo Developer Documentation](https://www.odoo.com/documentation/19.0/)
- [Railway Docs](https://docs.railway.app/)

<!-- Last deployment trigger: 2025-07-14 — re-triggered workflow with updated RAILWAY_TOKEN (cd71c683) -->

