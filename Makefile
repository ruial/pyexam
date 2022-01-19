.PHONY: test coverage lint shell run build clean install publish

test:
	pipenv run pytest -v

coverage:
	pipenv run pytest --cov=pyexam --cov-report term --cov-report html

lint:
	pipenv run flake8
	pipenv run mypy

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
