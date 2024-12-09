import "./Unit.tsp";
import "./BookingStatus.tsp";
import "./Contact.tsp";
import "./Ticket.tsp";

import "./capabilities/pricing/UnitItemPricing.tsp";

namespace Octo;

const UNIT_ITEM_UUID_DOC = "The id of the unit, this will be unique to the option.";
const UNIT_ITEM_RESELLER_REFERENCE_DOC = "A reference the reseller uses to identify the unit within all bookings.";
const UNIT_ITEM_SUPPLIER_REFERENCE_DOC = "A reference the supplier uses to identify the unit within all bookings.";
const UNIT_ITEM_UNIT_ID_DOC = "This MUST be a unique identifier within the scope of the option.";
const UNIT_UNIT_DOC = "";
const UNIT_STATUS_DOC = "The status of the booking, possible values are:\n`ON_HOLD` The booking is pending confirmation, this is the default value when you first create the booking.\n`EXPIRED` If the booking is not confirmed before the expiration hold expires, it goes into an expired state.\n`CONFIRMED` Once the confirmation call is made the booking is ready to be used.\n`CANCELLED` If the booking is cancelled.\n`PENDING` If the booking is pending outside availability confirmation.\n`REDEEMED` If the booking is already redeemed.";
const UNIT_UTC_REDEEMED_AT_DOC = "The ISO8601 date in UTC indicating when the ticket was used at the attraction.";
const UNIT_CONTACT_DOC = "Contact details for the guests that will attend the tour/attraction. Contact schema can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information)";
const UNIT_TICKET_DOC = "";

const UNIT_ITEM_UUID_EXAMPLE = "3b1bc2ee-3155-4738-9471-f49842a07327";
const UNIT_STATUS_EXAMPLE = BookingStatus.CONFIRMED;
const UNIT_UTC_REDEEMED_AT_EXAMPLE = null;
const UNIT_CONTACT_EXAMPLE = CONTACT_EXAMPLE;
const UNIT_TICKET_EXAMPLE = TICKET_EXAMPLE;

@example(UNIT_ITEM_ADULT_ON_HOLD)
model UnitItem {
  @doc(UNIT_ITEM_UUID_DOC)
  @example(UNIT_ITEM_UUID_EXAMPLE)
  uuid: string;

  @doc(UNIT_ITEM_RESELLER_REFERENCE_DOC)
  @example(UNIT_ITEM_ADULT_RESELLER_REFERENCE)
  resellerReference: string | null;

  @doc(UNIT_ITEM_SUPPLIER_REFERENCE_DOC)
  @example(UNIT_ITEM_ADULT_SUPPLIER_REFERENCE)
  supplierReference: string | null;

  @doc(UNIT_ITEM_UNIT_ID_DOC)
  @example(UNIT_ID_ADULT)
  unitId: string;

  @doc(UNIT_UNIT_DOC)
  @example(UNIT_ADULT_EXAMPLE)
  unit?: Unit;

  @doc(UNIT_STATUS_DOC)
  @example(UNIT_STATUS_EXAMPLE)
  status: BookingStatus;

  @doc(UNIT_UTC_REDEEMED_AT_DOC)
  @example(UNIT_UTC_REDEEMED_AT_EXAMPLE)
  utcRedeemedAt: string | null;

  @doc(UNIT_CONTACT_DOC)
  @example(UNIT_CONTACT_EXAMPLE)
  contact: Contact;

  @doc(UNIT_TICKET_DOC)
  @example(UNIT_TICKET_EXAMPLE)
  ticket: Ticket | null;

  // capabilities
  ...UnitItemPricing;
}

const UNIT_ITEM_ADULT_RESELLER_REFERENCE = "4ec08a62-892c-48c1-a608-dc946531a33a";
const UNIT_ITEM_ADULT_SUPPLIER_REFERENCE = "K9T7R4";

const UNIT_ITEM_CHILD_RESELLER_REFERENCE = "4ec08a62-892c-48c1-a608-dc946531a33b";
const UNIT_ITEM_CHILD_SUPPLIER_REFERENCE = "K9T7R5";

const UNIT_ITEM_INFANT_RESELLER_REFERENCE = "4ec08a62-892c-48c1-a608-dc946531a33c";
const UNIT_ITEM_INFANT_SUPPLIER_REFERENCE = "K9T7R6";

const UNIT_ITEM_ADULT_ON_HOLD = #{
  uuid: UNIT_ITEM_UUID_EXAMPLE,
  resellerReference: UNIT_ITEM_ADULT_RESELLER_REFERENCE,
  supplierReference: UNIT_ITEM_ADULT_SUPPLIER_REFERENCE,
  unitId: UNIT_ID_ADULT,
  unit: UNIT_ADULT_EXAMPLE,
  status: BookingStatus.ON_HOLD,
  utcRedeemedAt: null,
  contact: UNIT_CONTACT_EXAMPLE,
  ticket: null,
};

const UNIT_ITEM_ADULT_ON_HOLD_PRICING_EUR = #{
  ...UNIT_ITEM_ADULT_ON_HOLD,
  unit: UNIT_ADULT_EXAMPLE_PRICING_FINAL,
  ...UNIT_ITEM_PRICING_ADULT_EUR,
};

const UNIT_ITEM_ADULT_CONFIRMED = #{
  uuid: UNIT_ITEM_UUID_EXAMPLE,
  resellerReference: UNIT_ITEM_ADULT_RESELLER_REFERENCE,
  supplierReference: UNIT_ITEM_ADULT_SUPPLIER_REFERENCE,
  unitId: UNIT_ID_ADULT,
  unit: UNIT_ADULT_EXAMPLE,
  status: BookingStatus.ON_HOLD,
  utcRedeemedAt: null,
  contact: UNIT_CONTACT_EXAMPLE,
  ticket: UNIT_TICKET_EXAMPLE,
};

const UNIT_ITEM_ADULT_CONFIRMED_PRICING_EUR = #{
  ...UNIT_ITEM_ADULT_CONFIRMED,
  unit: UNIT_ADULT_EXAMPLE_PRICING_FINAL,
  ...UNIT_ITEM_PRICING_ADULT_EUR,
};

const UNIT_ITEM_CHILD_ON_HOLD = #{
  uuid: UNIT_ITEM_UUID_EXAMPLE,
  resellerReference: UNIT_ITEM_CHILD_RESELLER_REFERENCE,
  supplierReference: UNIT_ITEM_CHILD_SUPPLIER_REFERENCE,
  unitId: UNIT_ID_CHILD,
  unit: UNIT_CHILD_EXAMPLE,
  status: BookingStatus.ON_HOLD,
  utcRedeemedAt: null,
  contact: UNIT_CONTACT_EXAMPLE,
  ticket: null,
};

const UNIT_ITEM_CHILD_ON_HOLD_PRICING_EUR = #{
  ...UNIT_ITEM_CHILD_ON_HOLD,
  unit: UNIT_CHILD_EXAMPLE_PRICING_FINAL,
  ...UNIT_ITEM_PRICING_CHILD_EUR,
};

const UNIT_ITEM_CHILD_CONFIRMED = #{
  uuid: UNIT_ITEM_UUID_EXAMPLE,
  resellerReference: UNIT_ITEM_CHILD_RESELLER_REFERENCE,
  supplierReference: UNIT_ITEM_CHILD_SUPPLIER_REFERENCE,
  unitId: UNIT_ID_CHILD,
  unit: UNIT_CHILD_EXAMPLE,
  status: BookingStatus.CONFIRMED,
  utcRedeemedAt: null,
  contact: UNIT_CONTACT_EXAMPLE,
  ticket: UNIT_TICKET_EXAMPLE,
};

const UNIT_ITEM_CHILD_CONFIRMED_PRICING_EUR = #{
  ...UNIT_ITEM_CHILD_CONFIRMED,
  unit: UNIT_CHILD_EXAMPLE_PRICING_FINAL,
  ...UNIT_ITEM_PRICING_CHILD_EUR,
};

const UNIT_ITEM_INFANT_ON_HOLD = #{
  uuid: UNIT_ITEM_UUID_EXAMPLE,
  resellerReference: UNIT_ITEM_INFANT_RESELLER_REFERENCE,
  supplierReference: UNIT_ITEM_INFANT_SUPPLIER_REFERENCE,
  unitId: UNIT_ID_INFANT,
  unit: UNIT_INFANT_EXAMPLE,
  status: BookingStatus.ON_HOLD,
  utcRedeemedAt: null,
  contact: UNIT_CONTACT_EXAMPLE,
  ticket: null,
};

const UNIT_ITEM_INFANT_ON_HOLD_PRICING_EUR = #{
  ...UNIT_ITEM_INFANT_ON_HOLD,
  unit: UNIT_INFANT_EXAMPLE_PRICING_FINAL,
  ...UNIT_ITEM_PRICING_INFANT_EUR,
};

const UNIT_ITEM_INFANT_CONFIRMED = #{
  uuid: UNIT_ITEM_UUID_EXAMPLE,
  resellerReference: UNIT_ITEM_INFANT_RESELLER_REFERENCE,
  supplierReference: UNIT_ITEM_INFANT_SUPPLIER_REFERENCE,
  unitId: UNIT_ID_INFANT,
  unit: UNIT_INFANT_EXAMPLE,
  status: BookingStatus.CONFIRMED,
  utcRedeemedAt: null,
  contact: UNIT_CONTACT_EXAMPLE,
  ticket: UNIT_TICKET_EXAMPLE,
};

const UNIT_ITEM_INFANT_CONFIRMED_PRICING_EUR = #{
  ...UNIT_ITEM_INFANT_CONFIRMED,
  unit: UNIT_INFANT_EXAMPLE_PRICING_FINAL,
  ...UNIT_ITEM_PRICING_INFANT_EUR,
};
