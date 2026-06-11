# Custom Addons

Place your custom Odoo 19 modules here. Each module must be in its own subdirectory with at least `__init__.py` and `__manifest__.py`.

## Example structure

```
addons/
└── my_module/
    ├── __init__.py
    ├── __manifest__.py
    ├── models/
    │   └── __init__.py
    └── views/
```

## Python dependencies

If any of your modules require extra Python packages, list them in `addons/requirements.txt`. The Dockerfile will install them automatically during the build:

```
# addons/requirements.txt
requests>=2.28
```

## Notes

- The contents of this directory are copied to `/mnt/extra-addons/` inside the container.
- The Odoo 19 core modules are provided by the official `odoo:19` base image — they do not need to be added here.
- After adding or updating a module, commit and push to trigger a Railway redeploy.
