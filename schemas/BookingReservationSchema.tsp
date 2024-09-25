import "./common/BookingUnitItem.tsp";
import "./capabilities/pricing/BookingReservationPricingSchema.tsp";

const BOOKING_RESERVATION_BODY_UUID_DOC = "A unique UUID to identify the booking. Setting this value acts like an idempotency key preventing you from double booking.";
const BOOKING_RESERVATION_BODY_PRODUCT_ID_DOC = "The product ID for this booking.";
const BOOKING_RESERVATION_BODY_OPTION_ID_DOC = "The option ID for this booking.";
const BOOKING_RESERVATION_BODY_AVAILABILITY_ID_DOC = "The availability ID for the selected timeslot.";
const BOOKING_RESERVATION_BODY_EXPIRATION_MINUTES_DOC = "How many minutes to reserve the availability, otherwise defaults to the supplier default amount.";
const BOOKING_RESERVATION_BODY_NOTES_DOC = "Optional notes for the booking.";
const BOOKING_RESERVATION_BODY_UNIT_ITEMS_DOC = "An list of unit items that will be included in the booking.";

const BOOKING_RESERVATION_BODY_UUID_EXAMPLE = "559aed3d-6d5b-4fe0-bfca-99f5e7218a56";
const BOOKING_RESERVATION_BODY_PRODUCT_ID_EXAMPLE = PRODUCT_ID_EXAMPLE;
const BOOKING_RESERVATION_BODY_OPTION_ID_EXAMPLE = OPTION_ID_EXAMPLE;
const BOOKING_RESERVATION_BODY_AVAILABILITY_ID_EXAMPLE = AVAILABILITY_ID_EXAMPLE;
const BOOKING_RESERVATION_BODY_EXPIRATION_MINUTES_EXAMPLE = 30;
const BOOKING_RESERVATION_BODY_NOTES_EXAMPLE = "Optional notes";
const BOOKING_RESERVATION_BODY_UNIT_ITEMS_EXAMPLE = #[BOOKING_UNITITEM_EXAMPLE];

const BOOKING_RESRVATION_BODY_EXAMPLE = #{
  productId: BOOKING_RESERVATION_BODY_PRODUCT_ID_EXAMPLE,
  optionId: BOOKING_RESERVATION_BODY_OPTION_ID_EXAMPLE,
  availabilityId: BOOKING_RESERVATION_BODY_AVAILABILITY_ID_EXAMPLE,
  notes: BOOKING_RESERVATION_BODY_NOTES_EXAMPLE,
  unitItems: #[
    #{ unitId: UNIT_ID_ADULT },
    #{ unitId: UNIT_ID_CHILD },
    #{ unitId: UNIT_ID_INFANT }
  ],
};

const BOOKING_RESRVATION_BODY_PRICING_EXAMPLE = #{
  ...BOOKING_RESRVATION_BODY_EXAMPLE,
  currency: "EUR",
};

@example(BOOKING_RESRVATION_BODY_EXAMPLE)
model BookingReservationBody {
  @doc(BOOKING_RESERVATION_BODY_UUID_DOC)
  @example(BOOKING_RESERVATION_BODY_UUID_EXAMPLE)
  @format("uuid")
  uuid?: string;

  @doc(BOOKING_RESERVATION_BODY_PRODUCT_ID_DOC)
  @example(BOOKING_RESERVATION_BODY_PRODUCT_ID_EXAMPLE)
  productId: string;

  @doc(BOOKING_RESERVATION_BODY_OPTION_ID_DOC)
  @example(BOOKING_RESERVATION_BODY_OPTION_ID_EXAMPLE)
  optionId: string;

  @doc(BOOKING_RESERVATION_BODY_AVAILABILITY_ID_DOC)
  @example(BOOKING_RESERVATION_BODY_AVAILABILITY_ID_EXAMPLE)
  availabilityId: string;

  @doc(BOOKING_RESERVATION_BODY_EXPIRATION_MINUTES_DOC)
  @example(BOOKING_RESERVATION_BODY_EXPIRATION_MINUTES_EXAMPLE)
  expirationMinutes?: integer;

  @doc(BOOKING_RESERVATION_BODY_NOTES_DOC)
  @example(BOOKING_RESERVATION_BODY_NOTES_EXAMPLE)
  notes?: string;

  @doc(BOOKING_RESERVATION_BODY_UNIT_ITEMS_DOC)
  @example(BOOKING_RESERVATION_BODY_UNIT_ITEMS_EXAMPLE)
  unitItems: BookingUnitItem[];
  // capabilities
  ...BookingReservationPricingBody
}
