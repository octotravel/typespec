import "@typespec/openapi";

import "../../src/schemas/BookingConfirmationBody.tsp";
import "../models/SettlementMethod.tsp";
import "./common/BookingUnitItem.tsp";
import "./common/BookingContact.tsp";

namespace Ventrata;
using OpenAPI;

const BOOKING_CONFIRMATION_BODY_UNIT_ITEMS_EXAMPLE = #[
  BOOKING_UNIT_ITEM_EXAMPLE
];
const BOOKING_CONFIRMATION_BODY_CONTACT_EXAMPLE = BOOKING_CONTACT_BODY_EXAMPLE;

const BOOKING_CONFIRMATION_BODY_EXAMPLE = #{
  ...Octo.BOOKING_CONFIRMATION_BODY_EXAMPLE,
  unitItems: BOOKING_CONFIRMATION_BODY_UNIT_ITEMS_EXAMPLE,
  contact: BOOKING_CONFIRMATION_BODY_CONTACT_EXAMPLE,
};

@example(BOOKING_CONFIRMATION_BODY_EXAMPLE)
model BookingConfirmationBody extends Octo.BookingConfirmationBody {
  /**
   * An array of unit items in the booking. To retain or modify existing unit items, you must include the unit item with the associated uuid, otherwise that unit item will be removed.
   */
  @example(BOOKING_CONFIRMATION_BODY_UNIT_ITEMS_EXAMPLE)
  unitItems: BookingUnitItem[];

  /**
   * Contact details for the main guest who will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).
   */
  @example(BOOKING_CONFIRMATION_BODY_CONTACT_EXAMPLE)
  contact: BookingContact;
}
