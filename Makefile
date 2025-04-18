#Makefile
install: 
	pip install --upgrade pip &&\
	pip install -r requirements/requirements.txt
format:
	black *.py
lint:
	pylint --disable=R,C script.py
test: 
	python -m pytest tests/test_*.py
all: install lint test format
