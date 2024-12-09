namespace Octo;

const OPENING_HOURS_DOC = "Defines the opening hours for this availability, even for start time-based availability. Supports multiple periods for breaks in the day.";
const OPENING_HOURS_EXAMPLE = #{
  from: OPENING_HOURS_FROM_EXAMPLE,
  to: OPENING_HOURS_TO_EXAMPLE,
};

const OPENING_HOURS_FROM_DOC = "The opening time";
const OPENING_HOURS_TO_DOC = "The closing time";

const OPENING_HOURS_FROM_EXAMPLE = "08:00";
const OPENING_HOURS_TO_EXAMPLE = "16:00";

@doc(OPENING_HOURS_DOC)
@example(OPENING_HOURS_EXAMPLE)
model OpeningHours {
  @doc(OPENING_HOURS_FROM_DOC)
  @example(OPENING_HOURS_FROM_EXAMPLE)
  from: string;

  @doc(OPENING_HOURS_TO_DOC)
  @example(OPENING_HOURS_TO_EXAMPLE)
  to: string;
}
