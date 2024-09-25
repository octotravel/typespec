const RESTRICTIONS_MIN_AGE_DOC = "This is the minumum age this unit can be sold to";
const RESTRICTIONS_MAX_AGE_DOC = "This is the maximum age this unit can be sold to";
const RESTRICTIONS_ID_REQURED_DOC = "This is whether a form of identification will be required at redemption point (eg. student card)";
const RESTRICTIONS_MIN_QUANTITY_DOC = "This is if there is a minimum amount of units to be chosen for purchase (eg. ${RESTRICTIONS_MIN_QUANTITY_EXAMPLE})";
const RESTRICTIONS_MAX_QUANTITY_DOC = "This is if there is a maximum amount of units to be chosen for purchase (eg. ${RESTRICTIONS_MAX_QUANTITY_EXAMPLE})";
const RESTRICTIONS_PAX_COUNT_DOC = "This is the amount of people each unit counts as (eg. family == 4pax)";
const RESTRICTIONS_ACCOMPANIED_BY_DOC = "This is if the unit needs to be accompanied by another unit (eg. Infant with Adult)";

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
