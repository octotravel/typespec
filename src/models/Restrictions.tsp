import "./capabilities/content/RestrictionsContent.tsp";

namespace Octo;

const RESTRICTIONS_MIN_AGE_DOC = "Minimum age to purchase the unit.";
const RESTRICTIONS_MAX_AGE_DOC = "Maximum age to purchase the unit.";
const RESTRICTIONS_ID_REQURED_DOC = "Indicates if identification (e.g., student ID) is required for redemption.";
const RESTRICTIONS_MIN_QUANTITY_DOC = "Minimum number of units that must be purchased (e.g., 2 tickets). Null means no minimum.";
const RESTRICTIONS_MAX_QUANTITY_DOC = "Maximum number of units allowed in a single booking. Null means unlimited.";
const RESTRICTIONS_PAX_COUNT_DOC = "The number of people each unit represents (e.g., 1 family ticket = 4 pax).";
const RESTRICTIONS_ACCOMPANIED_BY_DOC = "Specifies if this unit must be accompanied by another unit (e.g., an infant ticket must be purchased with an adult ticket). Array of unit IDs which must be booked together. ";

const RESTRICTIONS_MIN_AGE_EXAMPLE = 3;
const RESTRICTIONS_MAX_AGE_EXAMPLE = 17;
const RESTRICTIONS_ID_REQURED_EXAMPLE = true;
const RESTRICTIONS_MIN_QUANTITY_EXAMPLE = 2;
const RESTRICTIONS_MAX_QUANTITY_EXAMPLE = 7;
const RESTRICTIONS_PAX_COUNT_EXAMPLE = 1;
const RESTRICTIONS_ACCOMPANIED_BY_EXAMPLE = #[
  "adult_697e3ce8-1860-4cbf-80ad-95857df1f640"
];

const RESTRICTIONS_EXAMPLE = #{
  minAge: RESTRICTIONS_MIN_AGE_EXAMPLE,
  maxAge: RESTRICTIONS_MAX_AGE_EXAMPLE,
  idRequired: RESTRICTIONS_ID_REQURED_EXAMPLE,
  minQuantity: RESTRICTIONS_MIN_QUANTITY_EXAMPLE,
  maxQuantity: RESTRICTIONS_MAX_QUANTITY_EXAMPLE,
  paxCount: RESTRICTIONS_PAX_COUNT_EXAMPLE,
  accompaniedBy: RESTRICTIONS_ACCOMPANIED_BY_EXAMPLE,
};

@example(RESTRICTIONS_EXAMPLE)
model Restrictions {
  @doc(RESTRICTIONS_MIN_AGE_DOC)
  @example(RESTRICTIONS_MIN_AGE_EXAMPLE)
  minAge: integer;

  @doc(RESTRICTIONS_MAX_AGE_DOC)
  @example(RESTRICTIONS_MAX_AGE_EXAMPLE)
  maxAge: integer;

  @doc(RESTRICTIONS_ID_REQURED_DOC)
  @example(RESTRICTIONS_ID_REQURED_EXAMPLE)
  idRequired: boolean;

  @doc(RESTRICTIONS_MIN_QUANTITY_DOC)
  @example(RESTRICTIONS_MIN_QUANTITY_EXAMPLE)
  minQuantity: integer | null;

  @doc(RESTRICTIONS_MAX_QUANTITY_DOC)
  @example(RESTRICTIONS_MAX_QUANTITY_EXAMPLE)
  maxQuantity: integer | null;

  @doc(RESTRICTIONS_PAX_COUNT_DOC)
  @example(RESTRICTIONS_PAX_COUNT_EXAMPLE)
  paxCount: integer;

  @doc(RESTRICTIONS_ACCOMPANIED_BY_DOC)
  @example(RESTRICTIONS_ACCOMPANIED_BY_EXAMPLE)
  accompaniedBy: string[];

  // octo/content
  ...RestrictionsContent;
}

const RESTRICTIONS_ADULT_EXAMPLE = #{
  minAge: 18,
  maxAge: 99,
  idRequired: false,
  minQuantity: 1,
  maxQuantity: 10,
  paxCount: 1,
  accompaniedBy: #[],
};

const RESTRICTIONS_CHILD_EXAMPLE = #{
  minAge: 3,
  maxAge: 12,
  idRequired: false,
  minQuantity: 1,
  maxQuantity: 10,
  paxCount: 1,
  accompaniedBy: #[],
};

const RESTRICTIONS_INFANT_EXAMPLE = #{
  minAge: 0,
  maxAge: 3,
  idRequired: false,
  minQuantity: 1,
  maxQuantity: 10,
  paxCount: 1,
  accompaniedBy: #[UNIT_ID_ADULT],
};
