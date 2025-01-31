import "@typespec/openapi";

import "./SelectOption.tsp";
import "./InputType.tsp";

namespace Ventrata;

using OpenAPI;

const QUESTION_ID_EXAMPLE = "";
const QUESTION_LABEL_EXAMPLE = "";
const QUESTION_HINT_EXAMPLE = "";
const QUESTION_MAX_LENGTH_EXAMPLE = 128;
const QUESTION_INPUT_TYPE_EXAMPLE = InputType.select;
const QUESTION_REQUIRED_EXAMPLE = false;
const QUESTION_SELECT_OPTIONS_EXAMPLE = #[SELECT_OPTION_EXAMPLE];

const QUESTION_EXAMPLE = #{
  id: QUESTION_ID_EXAMPLE,
  label: QUESTION_LABEL_EXAMPLE,
  hint: QUESTION_HINT_EXAMPLE,
  maxLength: QUESTION_MAX_LENGTH_EXAMPLE,
  inputType: QUESTION_INPUT_TYPE_EXAMPLE,
  required: QUESTION_REQUIRED_EXAMPLE,
  selectOptions: QUESTION_SELECT_OPTIONS_EXAMPLE,
};

model Question {
  /**
   * Unique identifier used in the platform to represent the question.
   */
  @example(QUESTION_ID_EXAMPLE)
  @extension("x-order", 1)
  @format("uuid")
  id: string;

  /**
   * The question that should be asked to the customer.
   */
  @example(QUESTION_LABEL_EXAMPLE)
  label: string | null;

  /**
   * A hint to help the customer answer the question.
   */
  @example(QUESTION_HINT_EXAMPLE)
  hint: string | null;

  /**
   * The maximum length of the answer to the question.
   */
  @example(QUESTION_MAX_LENGTH_EXAMPLE)
  maxLength: integer | null;

  /**
   * The type of input that should be used to answer the question. Possible values are `radio`, `select`, `textarea`.
   */
  @example(QUESTION_INPUT_TYPE_EXAMPLE)
  inputType: InputType;

  /**
   * `TRUE` identifies the question as required, and should therefore be answered by the customer
   */
  @example(QUESTION_REQUIRED_EXAMPLE)
  required: boolean;

  /**
   * The options that the customer can select from. Only present when `inputType` is `radio` or `select`.
   */
  @example(QUESTION_SELECT_OPTIONS_EXAMPLE)
  selectOptions: SelectOption[];
}
