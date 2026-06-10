FROM odoo:19

# Switch to root to install dependencies and copy files
USER root

# Copy custom addons into the Odoo extra-addons directory
COPY --chown=odoo:odoo . /mnt/extra-addons/

# Install Python dependencies if requirements.txt is present
RUN if [ -f /mnt/extra-addons/requirements.txt ]; then \
        pip3 install --no-cache-dir -r /mnt/extra-addons/requirements.txt; \
    fi

# Copy Odoo configuration file
COPY --chown=odoo:odoo odoo.conf /etc/odoo/odoo.conf

# Expose Odoo HTTP port
EXPOSE 8069

# Drop back to the unprivileged odoo user
USER odoo

# Start Odoo with the custom addons path
ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "--config=/etc/odoo/odoo.conf", "--addons-path=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons"]
