import "./UnitType.tsp";
import "./ContactField.tsp";
import "./Restrictions.tsp";
import "./capabilities/pricing/UnitPricing.tsp";
import "./capabilities/content/UnitContent.tsp";

namespace Octo;

const UNIT_ID_DOC = "The unique identifier for this unit within the scope of the option. This ID ensures that each unit can be uniquely referenced and managed.";
const UNIT_INTERNAL_NAME_DOC = "An internal name for the unit, used for backend purposes and not visible to customers. This field helps with identifying and managing the unit in the supplier’s system.";
const UNIT_REFERENCE_DOC = "An optional internal reference code used by the supplier for identification purposes. This field may not be unique and is meant for operational use.";
const UNIT_TYPE_DOC = "This is the base unit type for this unit definition. A value of TRAVELLER must only be used in replacement of ADULT, CHILD, INFANT, YOUTH, STUDENT, MILITARY or SENIOR. ";
const UNIT_RESTRICTIONS_DOC = "Specifies booking or usage restrictions for the unit.";
const UNIT_REQUIRED_CONTACT_FIELDS_DOC = """
  Lists the contact information required per ticket for the unit. Possible values include:
  firstName: First name of the ticket holder.
  lastName: Last name of the ticket holder.
  fullName: Full name, as a combination of first and last name.
  emailAddress: Email address of the ticket holder.
  phoneNumber: Phone number of the ticket holder.
  postalCode: Postal code for identification purposes.
  country: Country code (ISO 3166-1 alpha-2).
  notes: Additional notes or special instructions.
  locales: Locale preferences (IETF BCP 47 tags).
  """;

const UNIT_ID_EXAMPLE = "adult_697e3ce8-1860-4cbf-80ad-95857df1f640";
const UNIT_INTERNAL_NAME_EXAMPLE = "Adult(s)";
const UNIT_REFERENCE_EXAMPLE = "LR1-01-new";
const UNIT_TYPE_EXAMPLE = UnitType.ADULT;
const UNIT_RESTRICTIONS_EXAMPLE = "unit restrictions";
const UNIT_REQUIRED_CONTACT_FIELDS_EXAMPLE = #[ContactField.firstName];

const UNIT_ID_ADULT = "adult_697e3ce8-1860-4cbf-80ad-95857df1f640";
const UNIT_ID_CHILD = "child_797e3ce8-1860-4cbf-80ad-95857df1f640";
const UNIT_ID_INFANT = "infant_897e3ce8-1860-4cbf-80ad-95857df1f640";

const UNIT_EXAMPLE = #{
  id: UNIT_ID_EXAMPLE,
  internalName: UNIT_INTERNAL_NAME_EXAMPLE,
  reference: UNIT_REFERENCE_EXAMPLE,
  type: UNIT_TYPE_EXAMPLE,
  restrictions: RESTRICTIONS_EXAMPLE,
  requiredContactFields: UNIT_REQUIRED_CONTACT_FIELDS_EXAMPLE,
};

@example(UNIT_EXAMPLE)
model Unit {
  @doc(UNIT_ID_DOC)
  @example(UNIT_ID_EXAMPLE)
  id: string;

  @doc(UNIT_INTERNAL_NAME_DOC)
  @example(UNIT_INTERNAL_NAME_EXAMPLE)
  internalName: string;

  @doc(UNIT_REFERENCE_DOC)
  @example(UNIT_REFERENCE_EXAMPLE)
  reference: string | null;

  @doc(UNIT_TYPE_DOC)
  @example(UNIT_TYPE_EXAMPLE)
  type: UnitType;

  @doc(UNIT_RESTRICTIONS_DOC)
  @example(RESTRICTIONS_EXAMPLE)
  restrictions: Restrictions;

  @doc(UNIT_REQUIRED_CONTACT_FIELDS_DOC)
  @example(UNIT_REQUIRED_CONTACT_FIELDS_EXAMPLE)
  requiredContactFields: ContactField[];

  // octo/pricing
  ...UnitPricing;

  // octo/content
  ...UnitContent;
}

const UNIT_ADULT_EXAMPLE = #{
  id: UNIT_ID_ADULT,
  internalName: "Adult",
  reference: null,
  type: UnitType.ADULT,
  restrictions: RESTRICTIONS_ADULT_EXAMPLE,
  requiredContactFields: UNIT_REQUIRED_CONTACT_FIELDS_EXAMPLE,
};

const UNIT_CHILD_EXAMPLE = #{
  id: UNIT_ID_ADULT,
  internalName: "Child",
  reference: null,
  type: UnitType.CHILD,
  restrictions: RESTRICTIONS_CHILD_EXAMPLE,
  requiredContactFields: UNIT_REQUIRED_CONTACT_FIELDS_EXAMPLE,
};

const UNIT_INFANT_EXAMPLE = #{
  id: UNIT_ID_INFANT,
  internalName: "Infant",
  reference: null,
  type: UnitType.INFANT,
  restrictions: RESTRICTIONS_INFANT_EXAMPLE,
  requiredContactFields: UNIT_REQUIRED_CONTACT_FIELDS_EXAMPLE,
};

const UNIT_ADULT_EXAMPLE_PRICING = #{
  ...UNIT_ADULT_EXAMPLE,
  ...UNIT_PRICING_ADULT,
};

const UNIT_ADULT_EXAMPLE_PRICING_FINAL = #{
  ...UNIT_ADULT_EXAMPLE,
  ...UNIT_PRICING_ADULT_FINAL,
};

const UNIT_CHILD_EXAMPLE_PRICING = #{
  ...UNIT_CHILD_EXAMPLE,
  ...UNIT_PRICING_CHILD,
};

const UNIT_CHILD_EXAMPLE_PRICING_FINAL = #{
  ...UNIT_CHILD_EXAMPLE,
  ...UNIT_PRICING_CHILD_FINAL,
};

const UNIT_INFANT_EXAMPLE_PRICING = #{
  ...UNIT_INFANT_EXAMPLE,
  ...UNIT_PRICING_INFANT,
};

const UNIT_INFANT_EXAMPLE_PRICING_FINAL = #{
  ...UNIT_INFANT_EXAMPLE,
  ...UNIT_PRICING_INFANT_FINAL,
};
