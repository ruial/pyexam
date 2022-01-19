# pyexam

A package and CLI application to convert simple YAML documents to LaTeX and PDF exams. You can use custom templates to change the visual design of the exam or even export it to a new format.

## Setup

Install a LaTeX distribution and make sure ```latexmk``` is set in your system path.

```sh
pip install pyexam
```

## Usage

You need to define an YAML file for each exam. Check the [example document](https://github.com/ruial/pyexam/blob/master/examples/cs-101-exam.yml) and try the following commands:

```sh
# Export exam
python -m pyexam -i examples/cs-101-exam.yml -f pdf -o examples/output-exam

# Export exam solutgithion
pyexam -i examples/cs-101-exam.yml -f pdf -o examples/output-exam-solution -s

# All arguments
pyexam [-h] -i FILE [-o OUT] [-t TEMPLATE] [-s | --solution | --no-solution] [-f {latex,pdf}] [-l LEVEL]
optional arguments:
  -h, --help            show this help message and exit
  -i FILE, --input-file FILE
  -o OUT, --output-dir OUT
  -t TEMPLATE, --template-dir TEMPLATE
  -s, --solution, --no-solution
  -f {latex,pdf}, --format {latex,pdf}
  -l LEVEL, --log-level LEVEL
```

The final result will look like this:

![exam example](https://raw.githubusercontent.com/ruial/pyexam/master/examples/screenshot.png)

You can also import this package to use in your own Python code, as demonstrated in [tests](https://github.com/ruial/pyexam/tree/master/tests). Some new possible features include generating exams from a question bank or randomize the questions to produce multiple exam versions.

Beware that all input is trusted to increase customizability and keep the code simpler, you should sanitize the input for unstrusted clients.
