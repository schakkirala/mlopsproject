#Makefile
install: 
	pip install --upgrade pip &&\
	pip install -r requirements/requirements.txt
format:
	black *.py
test: 
	python -m pytest tests/test_*.py
all: install test format
