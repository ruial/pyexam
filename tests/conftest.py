import pytest

from pyexam import Exam, load


@pytest.fixture
def exam() -> Exam:
    return load('examples/cs-101-exam.yml')
