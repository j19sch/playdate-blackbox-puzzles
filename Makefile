build: lint
	pdc -k source pbbp.pdx

build-tests:
	cp -R -u source/assets tests
	pdc -k -I source tests pbbp-tests.pdx

lint:
	luacheck source

clean-test-assets:
	rm -R tests/assets
