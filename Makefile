.PHONY: test coverage lint format shell run install build clean publish

test:
	poetry run pytest -v

coverage:
	poetry run pytest --cov=pyexam --cov-report term --cov-report html

lint:
	poetry run black pyexam tests --check
	poetry run isort pyexam tests --check
	poetry run flake8 pyexam tests
	poetry run mypy pyexam tests

format:
	poetry run black pyexam tests
	poetry run isort pyexam tests

shell:
	poetry shell

run:
	poetry run pyexam -i examples/cs-101-exam.yml

install:
	poetry install

build:
	poetry build

clean:
	rm -rf .coverage htmlcov .mypy_cache .pytest_cache dist

publish: build
	poetry publish
