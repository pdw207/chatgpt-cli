build: # build file locally
	python -m build

verify-build: build # verify build passes
	twine check dist/*

publish: ## Publish on https://pypi.org/
	 twine upload dist/* --verbose