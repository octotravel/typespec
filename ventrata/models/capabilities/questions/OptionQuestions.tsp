import "@typespec/openapi";

import "./Question.tsp";

namespace Ventrata;

using OpenAPI;

const OPTION_QUESTIONS_QUESTIONS_EXAMPLE = #[QUESTION_EXAMPLE];

const OPTION_QUESTIONS_EXAMPLE = #{
  questions: OPTION_QUESTIONS_QUESTIONS_EXAMPLE,
};

@example(OPTION_QUESTIONS_EXAMPLE)
model OptionQuestions {
  /**
   * Questions for this option. Only present when octo/questions capability is requested.
   */
  @example(OPTION_QUESTIONS_QUESTIONS_EXAMPLE)
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
