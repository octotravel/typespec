import "./Question.tsp";

namespace Ventrata;

const QUESTION_ANSWER_QUESTION_ID_EXAMPLE = "";
const QUESTION_ANSWER_VALUE_EXAMPLE = "";

const QUESTION_ANSWER_EXAMPLE = #{
  ...QUESTION_EXAMPLE,
  questionId: QUESTION_ANSWER_QUESTION_ID_EXAMPLE,
  value: QUESTION_ANSWER_VALUE_EXAMPLE,
};

@example(QUESTION_ANSWER_EXAMPLE)
model QuestionAnswer extends Question {
  /**
   * Unique identifier used in the platform to represent the question.
   */
  @example(QUESTION_ANSWER_QUESTION_ID_EXAMPLE)
  @format("uuid")
  questionId: string;

  /**
   * The answer to the question.
   */
  @example(QUESTION_ANSWER_VALUE_EXAMPLE)
  value?: string;
}
