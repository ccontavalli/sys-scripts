.PHONY: docs

docs: README.ac-dmcrypt-manage

README.ac-dmcrypt-manage:
	perldoc ac-dmcrypt-manage |col -b > ./README.ac-dmcrypt-manage

