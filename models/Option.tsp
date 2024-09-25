import "./Unit.tsp";
import "./capabilities/pricing/OptionPricing.tsp";

const OPTION_ID_DOC = "The id that identifies this option, it is only unique within the product.";
const OPTION_DEFAULT_DOC = "`TRUE` identifies the option as default, and should therefore rendered and selected first";
const OPTION_INTERNAL_NAME_DOC = "The name the supplier calls the option by.";
const OPTION_REFERENCE_DOC = "An optional code this supplier might use to identify the product.";
const OPTION_AVAILABILITY_LOCAL_START_TIMES_DOC = "This will be an array of all possible start times that can be returned during availability. For example an all day attraction may have a single value like `[\"00:00\"]` whilst a tour with multiple departure times may have multiple:`[\"09:00\", \"14:00\", \"17:00\"]`.";
const OPTION_CANCELLATION_CUTOFF_DOC = "This is how long before the tour the booking can be still be cancelled.";
const OPTION_CANCELLATION_CUTOFF_AMOUNT_DOC = "The numeric amount for the cutoff.";
const OPTION_CANCELLATION_CUTOFF_UNIT_DOC = "Time units used to determine duration. Three values are available: `hour`, `minute`, `day`.";
const OPTION_REQUIRED_CONTACT_FIELDS_DOC = "An array of the contact fields required to confirm a booking. These just apply to the lead traveller on the booking and not for every ticket.";
const OPTION_RESTRICTIONS_DOC = "An object containing a fixed list of restrictions for booking the option.";
const OPTION_UNITS_DOC = "The list of ticket types (units) available for sale";

const OPTION_ID_EXAMPLE = "DEFAULT";
const OPTION_DEFAULT_EXAMPLE = true;
const OPTION_INTERNAL_NAME_EXAMPLE = "DEFAULT";
const OPTION_REFERENCE_EXAMPLE = null;
const OPTION_AVAILABILITY_LOCAL_START_TIMES_EXAMPLE = #["00:00"];
const OPTION_CANCELLATION_CUTOFF_EXAMPLE = "1 hour";
const OPTION_CANCELLATION_CUTOFF_AMOUNT_EXAMPLE = 1;
const OPTION_CANCELLATION_CUTOFF_UNIT_EXAMPLE = CancellationCutoffUnit.hour;
const OPTION_REQUIRED_CONTACT_FIELDS_EXAMPLE = #[ContactField.firstName];
const OPTION_UNITS_EXAMPLE = #[
  UNIT_ADULT_EXAMPLE,
  UNIT_CHILD_EXAMPLE,
  UNIT_INFANT_EXAMPLE
];

const OPTION_EXAMPLE = #{
  id: OPTION_ID_EXAMPLE,
  default: OPTION_DEFAULT_EXAMPLE,
  internalName: OPTION_INTERNAL_NAME_EXAMPLE,
  reference: OPTION_REFERENCE_EXAMPLE,
  availabilityLocalStartTimes: OPTION_AVAILABILITY_LOCAL_START_TIMES_EXAMPLE,
  cancellationCutoff: OPTION_CANCELLATION_CUTOFF_EXAMPLE,
  cancellationCutoffAmount: OPTION_CANCELLATION_CUTOFF_AMOUNT_EXAMPLE,
  cancellationCutoffUnit: OPTION_CANCELLATION_CUTOFF_UNIT_EXAMPLE,
  requiredContactFields: OPTION_REQUIRED_CONTACT_FIELDS_EXAMPLE,
  restrictions: OPTION_RESTRICTIONS_EXAMPLE,
  units: OPTION_UNITS_EXAMPLE,
};

@example(OPTION_EXAMPLE)
model Option {
  @doc(OPTION_ID_DOC)
  @example(OPTION_ID_EXAMPLE)
  id: string;

  @doc(OPTION_DEFAULT_DOC)
  @example(OPTION_DEFAULT_EXAMPLE)
  default: boolean;

  @doc(OPTION_INTERNAL_NAME_DOC)
  @example(OPTION_INTERNAL_NAME_EXAMPLE)
  internalName: string;

  @doc(OPTION_REFERENCE_DOC)
  @example(OPTION_REFERENCE_EXAMPLE)
  reference: string | null;

  @doc(OPTION_AVAILABILITY_LOCAL_START_TIMES_DOC)
  @example(OPTION_AVAILABILITY_LOCAL_START_TIMES_EXAMPLE)
  @minItems(1)
  availabilityLocalStartTimes: string[];

  @doc(OPTION_CANCELLATION_CUTOFF_DOC)
  @example(OPTION_CANCELLATION_CUTOFF_EXAMPLE)
  cancellationCutoff: string;

  @doc(OPTION_CANCELLATION_CUTOFF_AMOUNT_DOC)
  @example(OPTION_CANCELLATION_CUTOFF_AMOUNT_EXAMPLE)
  cancellationCutoffAmount: integer;

  @doc(OPTION_CANCELLATION_CUTOFF_UNIT_DOC)
  @example(CancellationCutoffUnit.hour)
  cancellationCutoffUnit: CancellationCutoffUnit;

  @doc(OPTION_REQUIRED_CONTACT_FIELDS_DOC)
  @example(OPTION_REQUIRED_CONTACT_FIELDS_EXAMPLE)
  requiredContactFields: ContactField[];

  @doc(OPTION_RESTRICTIONS_DOC)
  @example(OPTION_RESTRICTIONS_EXAMPLE)
  restrictions: OptionRestrictions;

  @doc(OPTION_UNITS_DOC)
  @example(OPTION_UNITS_EXAMPLE)
  units: Unit[];
// capabilities
  ...OptionPricing;
}

const OPTION_EXAMPLE_PRICING_PER_BOOKING = #{
  ...OPTION_EXAMPLE,
  ...OPTION_PRICING_PER_BOOKING
};

const OPTION_EXAMPLE_PRICING_PER_UNIT = #{
  ...OPTION_EXAMPLE,
  ...OPTION_PRICING_PER_UNIT,
  units: #[
    UNIT_ADULT_EXAMPLE_PRICING,
    UNIT_CHILD_EXAMPLE_PRICING,
    UNIT_INFANT_EXAMPLE_PRICING
  ]
};


const OPTION_RESTRICTIONS_MIN_UNITS_DOC = "The minimum number of tickets that can be purchased in a single booking (null = 0).";
const OPTION_RESTRICTIONS_MAX_UNITS_DOC = "The maximum number of tickets that can be purchased in a single booking (null = unlimited).";

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

@example(CancellationCutoffUnit.hour)
enum CancellationCutoffUnit {
  hour,
  minute,
  day,
}
