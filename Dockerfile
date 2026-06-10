FROM odoo:19

USER root

# Copy only the custom addons (not the entire repo)
COPY --chown=odoo:odoo addons/ /mnt/extra-addons/

# Install Python dependencies if requirements.txt is present
RUN if [ -f /mnt/extra-addons/requirements.txt ]; then \
    pip3 install --no-cache-dir -r /mnt/extra-addons/requirements.txt; \
fi

# Copy Odoo configuration file
COPY --chown=odoo:odoo odoo.conf /etc/odoo/odoo.conf

EXPOSE 8069

USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "--config=/etc/odoo/odoo.conf", "--addons-path=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons"]
