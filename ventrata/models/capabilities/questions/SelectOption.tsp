namespace Ventrata;

const SELECT_OPTION_LABEL_EXAMPLE = "";
const SELECT_OPTION_VALUE_EXAMPLE = "";

const SELECT_OPTION_EXAMPLE = #{
  label: SELECT_OPTION_LABEL_EXAMPLE,
  value: SELECT_OPTION_VALUE_EXAMPLE,
};

@example(SELECT_OPTION_EXAMPLE)
model SelectOption {
  /**
   * The label that will be shown to the customer.
   */
  @example(SELECT_OPTION_LABEL_EXAMPLE)
  label: string;

  /**
   * The value that will be sent to the supplier.
   */
  @example(SELECT_OPTION_VALUE_EXAMPLE)
  value: string;
}
