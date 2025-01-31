import "./BookingAdjustment.tsp";

import "@typespec/openapi";

namespace Ventrata;

using OpenAPI;

const BOOKING_ADJUSTMENTS_ADJUSTMENTS_DOC = "An array of adjustments that will be included in the booking. This field is only present when octo/adjustments capability is requested.";
const BOOKING_ADJUSTMENTS_ADJUSTMENTS_EXAMPLE = #[BOOKING_ADJUSTMENT_EXAMPLE];

model BookingAdjustments {
  @doc(BOOKING_ADJUSTMENTS_ADJUSTMENTS_DOC)
  @example(BOOKING_ADJUSTMENTS_ADJUSTMENTS_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/adjustments",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/adjustments",
      required: true,
    }
  )
  adjustments?: BookingAdjustment[];
}
