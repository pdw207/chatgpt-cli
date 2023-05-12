setup: ## setup virtual environment
	python -m venv .venv

install: setup ## install dependencies
	pip install twine
	pipe install build

build: ## build file locally
	python -m build

verify: build ## verify build passes
	twine check dist/*

sha256: # get checksum of build
		sha256sum dist/*.tar.gz

publish: ## Publish on https://pypi.org/
	 twine upload dist/* --verbose