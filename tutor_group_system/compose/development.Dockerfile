FROM python:3.6

# Do everything relative to /usr/src/app which is where we install our
# application.
WORKDIR /usr/src/app

# Install any explicit requirements
ADD requirements/*.txt ./requirements/
RUN pip install -r ./requirements/developer.txt

# The tutor group system source will be mounted here as a volume
VOLUME /usr/src/app

# Copy startup script
ADD ./compose/start-devserver.sh ./compose/wait-for-it.sh /tmp/

# By default, use the Django development server to serve the application and use
# developer-specific settings.
#
# *DO NOT DEPLOY THIS TO PRODUCTION*
ENV DJANGO_SETTINGS_MODULE tutor_group_system_project.settings_developer
ENTRYPOINT ["/tmp/wait-for-it.sh", "tutor_group_system-db:5432", "--"]
CMD ["/tmp/start-devserver.sh"]
