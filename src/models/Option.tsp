import "./Unit.tsp";
import "./CancellationCutoffUnit.tsp";
import "./OptionRestrictions.tsp";
import "./capabilities/pricing/OptionPricing.tsp";
import "./capabilities/content/OptionContent.tsp";

namespace Octo;

const OPTION_ID_DOC = "A unique identifier for the option within the product. This ID is critical for identifying specific options during bookings or other API interactions.";
const OPTION_DEFAULT_DOC = """
  Indicates whether the option is the default selection.
  true: This option should be rendered and selected first in customer-facing interfaces.
  false: The option is not default and requires manual selection.
  """;
const OPTION_INTERNAL_NAME_DOC = "The internal name used by the supplier to refer to the option. This name is for internal or operational purposes and may differ from the public, customer-facing name. The customer-facing name is defined separately in the title field under the octo/content capability.";
const OPTION_REFERENCE_DOC = "An optional internal code used by the supplier to refer to the product. This field is useful for supplier-specific workflows or cross-referencing. It can be null if no reference code exists for the product.";
const OPTION_AVAILABILITY_LOCAL_START_TIMES_DOC = "An array containing all possible start times for the option that can be returned during availability. For example a tour with multiple departure times may have multiple:[\"09:00\", \"14:00\", \"17:00\"].";
const OPTION_CANCELLATION_CUTOFF_DOC = "A text description of the option's cancellation policy, providing clear guidelines to customers.";
const OPTION_CANCELLATION_CUTOFF_AMOUNT_DOC = "The numeric value of the cutoff period for cancellations, relative to start time or closing hour (of opening hours product)";
const OPTION_CANCELLATION_CUTOFF_UNIT_DOC = """
  The time unit associated with the cutoff period. Possible values are:
  hour: Cutoff is measured in hours.
  minute: Cutoff is measured in minutes.
  day: Cutoff is measured in days.
  """;
const OPTION_REQUIRED_CONTACT_FIELDS_DOC = """
  An array specifying the contact fields required to confirm a booking. These apply to the lead traveler, not individual tickets. Possible values:
  firstName: The first name of the traveler.
  lastName: The last name of the traveler.
  fullName: The full name of the traveler.
  emailAddress: The email address of the traveler.
  phoneNumber: The phone number of the traveler.
  postalCode: The postal code of the traveler.
  country: The country of the traveler.
  notes: Optional notes from the traveler.
  locales: Preferred language/localization preferences.
  """;
const OPTION_RESTRICTIONS_DOC = "Specifies the limitations on booking the option.";
const OPTION_UNITS_DOC = "The list array of all units (ticket types) available for this product. Each unit represents a specific type of ticket (e.g., Adult, Child). See Unit for a detailed on the object.";

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

@example(OPTION_EXAMPLE_PRICING_PER_BOOKING)
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

  ...OptionContent;
}

// Examples Capabilities

// octo/pricing
const OPTION_EXAMPLE_PRICING_PER_BOOKING = #{
  ...OPTION_EXAMPLE,
  ...OPTION_PRICING_PER_BOOKING,
};

const OPTION_EXAMPLE_PRICING_PER_UNIT = #{
  ...OPTION_EXAMPLE,
  ...OPTION_PRICING_PER_UNIT,
  units: #[
    UNIT_ADULT_EXAMPLE_PRICING,
    UNIT_CHILD_EXAMPLE_PRICING,
    UNIT_INFANT_EXAMPLE_PRICING
  ],
};

// octo/content

const OPTION_EXAMPLE_CONTENT = #{
  ...OPTION_EXAMPLE,
  ...OPTION_CONTENT_EXAMPLE,
  units: #[
    UNIT_ADULT_EXAMPLE_CONTENT,
    UNIT_CHILD_EXAMPLE_CONTENT,
    UNIT_INFANT_EXAMPLE_CONTENT
  ],
};
