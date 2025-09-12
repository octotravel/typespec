namespace Octo;

const AVAILABILITY_UNIT_ID_DOC = "The unit id.";
const AVAILABILITY_UNIT_QUANTITY_DOC = "The quantity of the unit.";

const AVAILABILITY_UNIT_ID_EXAMPLE = "adult";
const AVAILABILITY_UNIT_QUANTITY_EXAMPLE = 2;

const AVILABILITY_UNIT_EXAMPLE = #{
  id: AVAILABILITY_UNIT_ID_EXAMPLE,
  quantity: AVAILABILITY_UNIT_QUANTITY_EXAMPLE,
};

@doc("A list of units.")
@example(AVILABILITY_UNIT_EXAMPLE)
model AvailabilityUnit {
  @doc(AVAILABILITY_UNIT_ID_DOC)
  @example(AVAILABILITY_UNIT_ID_EXAMPLE)
  id: string;

  @doc(AVAILABILITY_UNIT_QUANTITY_DOC)
  @example(AVAILABILITY_UNIT_QUANTITY_EXAMPLE)
  quantity: integer;
}
