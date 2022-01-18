import pytest
from pydantic import ValidationError

from pyexam import Exam, render
from pyexam.questions import FillIn


def test_render_no_solution(exam):
    assert render(exam).split('\n', 1)[0] == '\\documentclass[12pt]{exam}'


def test_render_has_solution(exam):
    assert render(exam, True).split('\n', 1)[0] == '\\documentclass[12pt,answers]{exam}'


def test_exam_has_sections(exam):
    assert len(exam.sections) == 2
    assert exam.questions is None


def test_exam_no_questions_or_sections():
    with pytest.raises(ValidationError):
        Exam(name='test')


def test_exam_has_questions():
    exam = Exam(name='test', questions=[FillIn(text='example \\fillin[test]')])
    assert len(exam.questions) == 1
    assert exam.sections is None
