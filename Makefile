.PHONY: test coverage lint format shell run install build clean publish

test:
	pipenv run pytest -v

coverage:
	pipenv run pytest --cov=pyexam --cov-report term --cov-report html

lint:
	pipenv run flake8
	pipenv run mypy

format:
	autopep8 pyexam tests --recursive --in-place --pep8-passes 2000
	isort pyexam tests

shell:
	pipenv shell

run:
	pipenv run python -m pyexam -i examples/cs-101-exam.yml

install:
	pipenv install --dev

build:
	python -m build

clean:
	rm -rf *.egg-info dist

publish: build
	twine upload dist/*
