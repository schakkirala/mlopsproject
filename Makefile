#Makefile
install: 
	pip install --ugrade pip &&\
	pip install -r requirements.txt
format:
	black *.py
lint:
	pylint --disable=R,C script.py
test: 
	python -m pytest tests/test_*.py
all: install lint test format
