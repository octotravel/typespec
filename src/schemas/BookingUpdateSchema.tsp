import "./common/BookingUnitItem.tsp";
import "./common/BookingContact.tsp";

namespace Octo;

const BOOKING_UPDATE_RESELLER_REFERENCE_DOC = BOOKING_CONFIRMATION_RESELLER_REFERENCE_DOC;
const BOOKING_UPDATE_PRODUCT_ID_DOC = "The product ID.";
const BOOKING_UPDATE_OPTION_ID_DOC = "The option id.";
const BOOKING_UPDATE_AVAILABILITY_ID_DOC = "The availability ID for the selected timeslot.";
const BOOKING_UPDATE_EXPIRATION_MINUTES_DOC = "How many minutes to reserve the availability, otherwise defaults to the supplier default amount.";
const BOOKING_UPDATE_NOTES_DOC = "Optional notes for the booking.";
const BOOKING_UPDATE_EMAIL_RECEIPT_DOC = "Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false).";
const BOOKING_UPDATE_UNITITEMS_DOC = "An array of unit items in the booking. To retain or modify existing unit items, you must include the unit item with the associated uuid, otherwise that unit item will be removed.";
const BOOKING_UPDATE_CONTACT_DOC = "Contact details for the main guest who will attend the tour/attraction. Contact schema can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).";

const BOOKING_UPDATE_RESELLER_REFERENCE_EXAMPLE = "VOUCHER-0123";
const BOOKING_UPDATE_PRODUCT_ID_EXAMPLE = PRODUCT_ID_EXAMPLE;
const BOOKING_UPDATE_OPTION_ID_EXAMPLE = OPTION_ID_EXAMPLE;
const BOOKING_UPDATE_AVAILABILITY_ID_EXAMPLE = AVAILABILITY_ID_EXAMPLE;
const BOOKING_UPDATE_EXPIRATION_MINUTES_EXAMPLE = EXTEND_RESERVATION_SCHMEA_EXPIRATION_MINUTES_EXAMPLE;
const BOOKING_UPDATE_NOTES_EXAMPLE = "Optional notes";
const BOOKING_UPDATE_EMAIL_RECEIPT_EXAMPLE = true;
const BOOKING_UPDATE_UNITITEMS_EXAMPLE = #[BOOKING_UNITITEM_EXAMPLE];
const BOOKING_UPDATE_CONTACT_EXAMPLE = BOOKING_CONTACT_SCHEMA_EXAMPLE;

const BOOKING_UPDATE_BODY_EXAMPLE = #{
  resellerReference: BOOKING_UPDATE_RESELLER_REFERENCE_EXAMPLE,
  productId: BOOKING_UPDATE_PRODUCT_ID_EXAMPLE,
  optionId: BOOKING_UPDATE_OPTION_ID_EXAMPLE,
  availabilityId: BOOKING_UPDATE_AVAILABILITY_ID_EXAMPLE,
  expirationMinutes: BOOKING_UPDATE_EXPIRATION_MINUTES_EXAMPLE,
  notes: BOOKING_UPDATE_NOTES_EXAMPLE,
  emailReceipt: BOOKING_UPDATE_EMAIL_RECEIPT_EXAMPLE,
  unitItems: BOOKING_UPDATE_UNITITEMS_EXAMPLE,
  contact: BOOKING_UPDATE_CONTACT_EXAMPLE,
};

@example(BOOKING_UPDATE_BODY_EXAMPLE)
model BookingUpdateBody {
  @doc(BOOKING_UPDATE_RESELLER_REFERENCE_DOC)
  @example(BOOKING_UPDATE_RESELLER_REFERENCE_EXAMPLE)
  resellerReference?: string;

  @doc(BOOKING_UPDATE_PRODUCT_ID_DOC)
  @example(BOOKING_UPDATE_PRODUCT_ID_EXAMPLE)
  productId?: string;

  @doc(BOOKING_UPDATE_OPTION_ID_DOC)
  @example(BOOKING_UPDATE_OPTION_ID_EXAMPLE)
  optionId?: string;

  @doc(BOOKING_UPDATE_AVAILABILITY_ID_DOC)
  @example(BOOKING_UPDATE_AVAILABILITY_ID_EXAMPLE)
  availabilityId?: string;

  @doc(BOOKING_UPDATE_EXPIRATION_MINUTES_DOC)
  @example(BOOKING_UPDATE_EXPIRATION_MINUTES_EXAMPLE)
  expirationMinutes?: integer;

  @doc(BOOKING_UPDATE_NOTES_DOC)
  @example(BOOKING_UPDATE_NOTES_EXAMPLE)
  notes?: string;

  @doc(BOOKING_UPDATE_EMAIL_RECEIPT_DOC)
  @example(BOOKING_UPDATE_EMAIL_RECEIPT_EXAMPLE)
  emailReceipt?: boolean;

  @doc(BOOKING_UPDATE_UNITITEMS_DOC)
  @example(BOOKING_UPDATE_UNITITEMS_EXAMPLE)
  unitItems?: BookingUnitItem[];

  @doc(BOOKING_UPDATE_CONTACT_DOC)
  @example(BOOKING_UPDATE_CONTACT_EXAMPLE)
  contact?: BookingContact;
}
