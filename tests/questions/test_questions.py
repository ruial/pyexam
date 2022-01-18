import pytest
from pydantic import ValidationError

from pyexam.questions import MultipleChoice, Question, QuestionType


def test_valid_question():
    assert Question(text='example question', type=QuestionType.long_answer).type == 'long-answer'


def test_invalid_question():
    with pytest.raises(ValidationError):
        Question(text='example question', type='long-answer2')


def test_multiple_choice_correct():
    data = {
        "text": "Which of the following programming languages are generally interpreted?",
        "points": 1,
        "options": [
            {
                "text": "Go"
            },
            {
                "text": "Python",
                "correct": "yes"
            },
            {
                "text": "R",
                "correct": "yes"
            },
            {
                "text": "C++"
            }
        ]
    }
    question = MultipleChoice(**data)
    assert question.correct_choices == ['Python', 'R']
