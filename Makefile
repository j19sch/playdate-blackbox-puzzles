build: lint
	pdc -k source pbbp.pdx

build-tests: lint-tests
	cp -R -u source/assets tests
	pdc -k -I source tests pbbp-tests.pdx

lint:
	luacheck ./source

lint-tests:
	luacheck --config .luacheckrc-tests ./tests

clean-test-assets:
	rm -R tests/assets
