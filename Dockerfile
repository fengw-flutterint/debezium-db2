# Start with the official IBM DB2 image as the base
FROM ibmcom/db2@sha256:220c15de7eba67e97d6a3db0f08ae171d246acdfb18d7fd109ce43652f97676e

# Set maintainer label
LABEL maintainer="Feng Wang <fengw@fluterint.com>"

# Create directories for the CDC tools and give appropriate permissions
RUN mkdir -p /asncdctools/src && \
    chmod -R 777 /asncdctools && \
    mkdir /var/custom && \
    chmod -R 777 /var/custom

# Add your scripts and source files
COPY asncdc_UDF.sql /asncdctools/src/
COPY asncdcaddremove.sql /asncdctools/src/
COPY asncdctables.sql /asncdctools/src/
COPY dbsetup.sh /asncdctools/src/
COPY asncdc.c /asncdctools/src/
COPY cdcsetup.sh /var/custom/

# Give execute permission to the setup script
RUN chmod 777 /var/custom/cdcsetup.sh

# Additional setup and configuration commands can be added here

# Expose any necessary ports, set environment variables, etc.
# ...

# Specify the default command to run when the container starts
# (You can adjust this based on your requirements)
CMD ["/var/custom/cdcsetup.sh"]

