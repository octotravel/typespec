import "@typespec/openapi";

import "./QuestionAnswer.tsp";

namespace Ventrata;

using OpenAPI;

const UNIT_ITEM_QUESTIONS_QUESTION_ANSWERS_EXAMPLE = #[QUESTION_ANSWER_EXAMPLE];

const UNIT_ITEM_QUESTIONS_EXAMPLE = #{
  questionAnswers: UNIT_ITEM_QUESTIONS_QUESTION_ANSWERS_EXAMPLE,
};

@example(UNIT_ITEM_QUESTIONS_EXAMPLE)
model UnitItemQuestions {
  /**
   * Questions for this unit item. Only present when octo/questions capability is requested.
   */
  @example(UNIT_ITEM_QUESTIONS_QUESTION_ANSWERS_EXAMPLE)
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
