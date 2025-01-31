import "@typespec/openapi";

import "./Question.tsp";

namespace Ventrata;

using OpenAPI;

const UNIT_QUESTIONS_QUESTIONS_EXAMPLE = #[QUESTION_EXAMPLE];

const UNIT_QUESTIONS_EXAMPLE = #{ questions: UNIT_QUESTIONS_QUESTIONS_EXAMPLE };

@example(UNIT_QUESTIONS_EXAMPLE)
model UnitQuestions {
  /**
   * Questions for this unit. Only present when octo/questions capability is requested.
   */
  @example(UNIT_QUESTIONS_QUESTIONS_EXAMPLE)
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
  questions?: Question[];
}
