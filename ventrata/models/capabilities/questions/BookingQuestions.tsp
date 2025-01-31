import "@typespec/openapi";

import "./QuestionAnswer.tsp";

namespace Ventrata;

using OpenAPI;

const BOOKING_QUESTIONS_QUESTION_ANSWERS_EXAMPLE = #[QUESTION_ANSWER_EXAMPLE];

const BOOKING_QUESTIONS_EXAMPLE = #{
  questionAnswers: BOOKING_QUESTIONS_QUESTION_ANSWERS_EXAMPLE,
};

@example(BOOKING_QUESTIONS_EXAMPLE)
model BookingQuestions {
  /**
   * An array of questions and andswers that will be included in the booking.
   * This field is only present when octo/questions capability is requested.
   */
  @example(BOOKING_QUESTIONS_QUESTION_ANSWERS_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/questions",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/questions",
      required: true,
    }
  )
  @extension("x-go-type-skip-optional-pointer", true)
  questionAnswers?: QuestionAnswer[];
}
