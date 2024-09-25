const OPENING_HOURS_DOC = "A list of opening hours that the product is open on this day.";
const OPENING_HOURS_EXAMPLE = #{
  from: OPENING_HOURS_FROM_EXAMPLE,
  to: OPENING_HOURS_TO_EXAMPLE,
};

const OPENING_HOURS_FROM_DOC = "When this product opens (HH:MM)";
const OPENING_HOURS_TO_DOC = "When this product closes (HH:MM)";

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
