build:
	pdc -k source pbbp.pdx

build-test:
	pdc -k -I source tests pbbp-tests.pdx
