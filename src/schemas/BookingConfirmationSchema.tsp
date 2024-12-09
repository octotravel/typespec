import "./common/BookingUnitItem.tsp";
import "./common/BookingContact.tsp";

namespace Octo;

const BOOKING_CONFIRMATION_EMAIL_RECEIPT_DOC = "Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false)";
const BOOKING_CONFIRMATION_RESELLER_REFERENCE_DOC = "Your reference for this booking. Also known as a Voucher Number.";
const BOOKING_CONFIRMATION_CONTACT_DOC = "Contact details for the main guest who will attend the tour/attraction. Contact schema can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).";
const BOOKING_CONFIRMATION_UNITITEMS_DOC = "An array of unit items that will be included in the booking. This allows you to provide contact details or a reseller reference for each unit item. Be careful to make sure you include ALL unit items that you also had in the original booking reservation request, if you provide more or less than in the booking reservation call this will change the number of unit items being purchased also.";

const BOOKING_CONFIRMATION_EMAIL_RECEIPT_EXAMPLE = true;
const BOOKING_CONFIRMATION_RESELLER_REFERENCE_EXAMPLE = "VOUCHER-0123";
const BOOKING_CONFIRMATION_CONTACT_EXAMPLE = BOOKING_CONTACT_SCHEMA_EXAMPLE;
const BOOKING_CONFIRMATION_UNITITEMS_EXAMPLE = #[BOOKING_UNITITEM_EXAMPLE];

const BOOKING_CONFIRMATION_BODY_EXAMPLE = #{
  resellerReference: BOOKING_CONFIRMATION_RESELLER_REFERENCE_EXAMPLE,
  contact: BOOKING_CONFIRMATION_CONTACT_EXAMPLE,
};

@example(BOOKING_CONFIRMATION_BODY_EXAMPLE)
model BookingConfirmationBody {
  @doc(BOOKING_CONFIRMATION_EMAIL_RECEIPT_DOC)
  @example(BOOKING_CONFIRMATION_EMAIL_RECEIPT_EXAMPLE)
  emailReceipt?: boolean;

  @doc(BOOKING_CONFIRMATION_RESELLER_REFERENCE_DOC)
  @example(BOOKING_CONFIRMATION_RESELLER_REFERENCE_EXAMPLE)
  resellerReference?: string;

  @doc(BOOKING_CONFIRMATION_CONTACT_DOC)
  @example(BOOKING_CONTACT_SCHEMA_EXAMPLE)
  contact: BookingContact;

  @doc(BOOKING_CONFIRMATION_UNITITEMS_DOC)
  @example(BOOKING_CONFIRMATION_UNITITEMS_EXAMPLE)
  unitItems?: BookingUnitItem[];
}
