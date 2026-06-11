# Custom Addons

Place your custom Odoo 19 modules in this directory. Each subdirectory should be a valid Odoo module (containing at minimum an `__manifest__.py` and `__init__.py`).

## Structure

```
addons/
├── my_custom_module/
│   ├── __init__.py
│   ├── __manifest__.py
│   ├── models/
│   ├── views/
│   └── ...
└── another_module/
    └── ...
```

## Notes

- The Dockerfile copies this entire directory to `/mnt/extra-addons/` inside the container.
- The Odoo 19 core source is provided by the official `odoo:19` Docker image — it does not need to live in this repository.
- If any addon has Python dependencies, add them to a `requirements.txt` file in this directory and they will be installed automatically during the Docker build.
