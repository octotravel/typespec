import "./Refund.tsp";

namespace Octo;

const BOOKING_CANCELLATION_REFUND_DOC = "Whether the booking was refunded as part of the cancellation. Possible values are FULL, PARTIAL or NONE";
const BOOKING_CANCELLATION_REASON_DOC = "A text value describing why the cancellation happened.";
const BOOKING_CANCELLATION_UTC_CANCELLED_AT_DOC = "An ISO8601 date time in UTC indicating when the booking was cancelled.";

const BOOKING_CANCELLATION_REFUND_EXAMPLE = Refund.FULL;
const BOOKING_CANCELLATION_REASON_EXAMPLE = "this product sucks";
const BOOKING_CANCELLATION_UTC_CANCELLED_AT_EXAMPLE = "2022-05-25T11:00:22Z";

const BOOKING_CANCELLATION_EXAMPLE = #{
  refund: BOOKING_CANCELLATION_REFUND_EXAMPLE,
  reason: BOOKING_CANCELLATION_REASON_EXAMPLE,
  utcCancelledAt: BOOKING_CANCELLATION_UTC_CANCELLED_AT_EXAMPLE,
};

@example(BOOKING_CANCELLATION_EXAMPLE)
model BookingCancellation {
  @doc(BOOKING_CANCELLATION_REFUND_DOC)
  @example(BOOKING_CANCELLATION_REFUND_EXAMPLE)
  refund: Refund;

  @doc(BOOKING_CANCELLATION_REASON_DOC)
  @example(BOOKING_CANCELLATION_REASON_EXAMPLE)
  reason: string | null;

  @doc(BOOKING_CANCELLATION_UTC_CANCELLED_AT_DOC)
  @example(BOOKING_CANCELLATION_UTC_CANCELLED_AT_EXAMPLE)
  utcCancelledAt: string;
}
