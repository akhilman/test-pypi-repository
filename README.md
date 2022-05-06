# Test pypi repository

This repository conains two packages:
* `add_one`
* `call_add_one` (which depends form `add_one`)

## Running

Running in container:
```
$ podman build -t test-pypi-repository ./
$ podman run -d --rm -p 8080:8080/tcp test-pypi-repository
```
Replace `podman` with `docker` if you will.

## Testing

Open in browser [http://localhost:8080](http://localhost:8080)

Install packages with pip:
```
$ pip install --extra-index-url=http://localhost:8080/simple call-add-one  
```
