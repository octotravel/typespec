namespace Octo;

const OPTION_RESTRICTIONS_MIN_UNITS_DOC = "The minimum number of units (tickets) that can be purchased in a single booking. A null value indicates no minimum.";
const OPTION_RESTRICTIONS_MAX_UNITS_DOC = "The maximum number of units (tickets) that can be purchased in a single booking. A null value indicates no maximum.";

const OPTION_RESTRICTIONS_MIN_UNITS_EXAMPLE = 0;
const OPTION_RESTRICTIONS_MAX_UNITS_EXAMPLE = 9;

const OPTION_RESTRICTIONS_EXAMPLE = #{
  minUnits: OPTION_RESTRICTIONS_MIN_UNITS_EXAMPLE,
  maxUnits: OPTION_RESTRICTIONS_MAX_UNITS_EXAMPLE,
};

@example(OPTION_RESTRICTIONS_EXAMPLE)
model OptionRestrictions {
  @doc(OPTION_RESTRICTIONS_MIN_UNITS_DOC)
  @example(OPTION_RESTRICTIONS_MIN_UNITS_EXAMPLE)
  minUnits: integer | null;

  @doc(OPTION_RESTRICTIONS_MAX_UNITS_DOC)
  @example(OPTION_RESTRICTIONS_MAX_UNITS_EXAMPLE)
  maxUnits: integer | null;
}
