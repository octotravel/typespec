import "@typespec/openapi";

import "../../src/schemas/BookingReservationBody.tsp";
import "../models/SettlementMethod.tsp";
import "./common/BookingUnitItem.tsp";
import "./common/BookingContact.tsp";

namespace Ventrata;
using OpenAPI;

const BOOKING_RESERVATION_BODY_RESELLER_REFERENCE_EXAMPLE = "123321";
const BOOKING_RESERVATION_BODY_ALIAS_EXAMPLE = "alias";
const BOOKING_RESERVATION_BODY_SETTLEMENT_METHOD_EXAMPLE = SettlementMethod.DIRECT;
const BOOKING_RESERVATION_BODY_EMAIL_RECEIPT_EXAMPLE = false;
const BOOKING_RESERVATION_BODY_UNIT_ITEMS_EXAMPLE = #[
  BOOKING_UNIT_ITEM_EXAMPLE
];
const BOOKING_RESERVATION_BODY_QUOTE_EXAMPLE = false;
const BOOKING_RESERVATION_BODY_FREESALE_EXAMPLE = false;
const BOOKING_RESERVATION_BODY_REDEEMED_EXAMPLE = false;
const BOOKING_RESERVATION_BODY_CONTACT_EXAMPLE = BOOKING_CONTACT_BODY_EXAMPLE;

const BOOKING_RESERVATION_BODY_EXAMPLE = #{
  ...Octo.BOOKING_RESERVATION_BODY_EXAMPLE,
};

const BOOKING_RESERVATION_BODY_PRICING_EXAMPLE = #{
  ...BOOKING_RESERVATION_BODY_EXAMPLE,
  currency: "EUR",
};

@example(BOOKING_RESERVATION_BODY_EXAMPLE)
model BookingReservationBody extends Octo.BookingReservationBody {
  /**
   * Your reference for this booking. Also known as a Voucher Number.
   */
  @example(BOOKING_RESERVATION_BODY_RESELLER_REFERENCE_EXAMPLE)
  resellerReference?: string;

  @format("uuid") productId: string;
  @format("uuid") optionId: string;
  availabilityId?: string;

  /**
   * The alias of the unit item.
   */
  @example(BOOKING_RESERVATION_BODY_ALIAS_EXAMPLE)
  `alias`?: string;

  @example(BOOKING_RESERVATION_BODY_SETTLEMENT_METHOD_EXAMPLE)
  settlementMethod?: SettlementMethod;

  /**
   * How many minutes to reserve the availability, otherwise defaults to the supplier default amount.
   */
  @extension("x-go-type", "uint") expirationMinutes?: integer;

  /**
   * Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false).
   */
  @example(BOOKING_RESERVATION_BODY_EMAIL_RECEIPT_EXAMPLE)
  emailReceipt?: boolean;

  /**
   * An array of unit items in the booking. To retain or modify existing unit items, you must include the unit item with the associated uuid, otherwise that unit item will be removed.
   */
  @example(BOOKING_RESERVATION_BODY_UNIT_ITEMS_EXAMPLE)
  unitItems: BookingUnitItem[];

  /**
   * Whether to quote the booking instead of confirming it.
   */
  @example(BOOKING_RESERVATION_BODY_QUOTE_EXAMPLE)
  quote?: boolean;

  /**
   * Whether to set freesale mode.
   */
  @example(BOOKING_RESERVATION_BODY_FREESALE_EXAMPLE)
  freesale?: boolean;

  /**
   * Whether the booking was redeemed.
   */
  @example(BOOKING_RESERVATION_BODY_REDEEMED_EXAMPLE)
  redeemed?: boolean;

  /**
   * Contact details for the main guest who will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).
   */
  @example(BOOKING_RESERVATION_BODY_CONTACT_EXAMPLE)
  contact?: BookingContact;
}
