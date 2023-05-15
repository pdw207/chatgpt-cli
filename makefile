setup: ## setup virtual environment
	python -m venv .venv
	pipe install build

build: ## build file locally
	python -m build

sha: # get checksum of build
		sha256sum dist/*.tar.gz

test: # runs local formula for testing
	brew reinstall --debug --verbose Formula/nlshell.rb
