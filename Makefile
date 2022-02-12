.PHONY: lint test docs build release clean

NOSE2_VERSION=$(shell grep '^__version__' nose2/_version.py | cut -d '"' -f2)

lint:
	tox -e lint
test:
	tox
docs:
	tox -e docs

build:
	tox -e build

release:
	git tag -s "$(NOSE2_VERSION)" -m "v$(NOSE2_VERSION)"
	tox -e build,release


clean:
	$(MAKE) -C docs/ clean
	rm -rf .tox
