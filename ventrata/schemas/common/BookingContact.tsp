import "@typespec/openapi";

import "../../../src/schemas/common/BookingContact.tsp";

namespace Ventrata;
using OpenAPI;

const BOOKING_CONTACT_BODY_TAX_ID_EXAMPLE = "";
const BOOKING_CONTACT_BODY_STREET_ADDRESS_EXAMPLE = "";
const BOOKING_CONTACT_BODY_CITY_EXAMPLE = "";
const BOOKING_CONTACT_BODY_STATE_EXAMPLE = "";
const BOOKING_CONTACT_BODY_ALLOW_MARKETING_EXAMPLE = true;

const BOOKING_CONTACT_BODY_EXAMPLE = #{
  ...Octo.BOOKING_CONTACT_BODY_EXAMPLE,
  taxId: BOOKING_CONTACT_BODY_TAX_ID_EXAMPLE,
  streetAddress: BOOKING_CONTACT_BODY_STREET_ADDRESS_EXAMPLE,
  city: BOOKING_CONTACT_BODY_CITY_EXAMPLE,
  state: BOOKING_CONTACT_BODY_STATE_EXAMPLE,
  allowMarketing: BOOKING_CONTACT_BODY_ALLOW_MARKETING_EXAMPLE,
};

@example(BOOKING_CONTACT_BODY_EXAMPLE)
model BookingContact extends Octo.BookingContact {
  /**
   * The tax ID of the booking holder or the ticket holder.
   */
  @example(BOOKING_CONTACT_BODY_TAX_ID_EXAMPLE)
  taxId?: string | null;

  /**
   * The street address of the booking holder or the ticket holder.
   */
  @example(BOOKING_CONTACT_BODY_STREET_ADDRESS_EXAMPLE)
  streetAddress?: string | null;

  /**
   * The city of the booking holder or the ticket holder.
   */
  @example(BOOKING_CONTACT_BODY_CITY_EXAMPLE)
  city?: string | null;

  /**
   * The state of the booking holder or the ticket holder.
   */
  @example(BOOKING_CONTACT_BODY_STATE_EXAMPLE)
  state?: string | null;

  /**
   * Whether the booking holder or the ticket holder allows marketing.
   */
  @example(BOOKING_CONTACT_BODY_ALLOW_MARKETING_EXAMPLE)
  allowMarketing?: boolean;
}
