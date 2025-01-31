import "@typespec/openapi";

namespace Ventrata;
using OpenAPI;

const BOOKING_REJECTION_REASON_EXAMPLE = null;
const BOOKING_REJECTION_UTC_REJECTED_AT_EXAMPLE = utcDateTime.fromISO("2022-06-29T22:00:00Z");

const BOOKING_REJECTION_EXAMPLE = #{
  reason: BOOKING_REJECTION_REASON_EXAMPLE,
  utcRejectedAt: BOOKING_REJECTION_UTC_REJECTED_AT_EXAMPLE,
};

@example(BOOKING_REJECTION_EXAMPLE)
model BookingRejection {
  /**
   * A text value describing why the rejection happened.
   */
  @example(BOOKING_REJECTION_REASON_EXAMPLE)
  reason: string | null;

  /**
   * An RFC 3339 date time in UTC indicating when the booking was rejected.
   */
  @example(BOOKING_REJECTION_UTC_REJECTED_AT_EXAMPLE)
  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  utcRejectedAt: utcDateTime;
}
