FROM docker.io/library/python AS package-build
ADD add_one  /src/add_one
ADD call_add_one  /src/call_add_one
RUN pip install --upgrade build wheel
WORKDIR /src/add_one
RUN python -m build
WORKDIR /src/call_add_one
RUN python -m build

FROM docker.io/library/python AS package-repository
COPY --from=package-build --chown=www-data:www-data /src/call_add_one/dist /src/add_one/dist /packages
RUN pip install pypiserver
USER www-data
EXPOSE 8080/tcp
ENTRYPOINT pypi-server run -v -p 8080 /packages
