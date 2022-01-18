.PHONY: test coverage lint shell run build clean

test:
	pytest -v

coverage:
	pytest --cov=pyexam --cov-report term --cov-report html

lint:
	flake8
	mypy

shell:
	pipenv shell

run:
	python -m pyexam -i examples/cs-101-exam.yml

build:
	python -m build

clean:
	rm -rf *.egg-info dist
