.PHONY: docs clean

docs: docs/README.ac-dmcrypt-manage docs/README.ac-system-backup

docs/README.%:
	perldoc $* |col -b > ./$@

clean:
	rm -f ./docs/README.ac-*

