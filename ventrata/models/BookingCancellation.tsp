import "@typespec/openapi";

import "../../src/models/BookingCancellation.tsp";

import "./SettlementMethod.tsp";

import "./capabilities/ventrata-content/ProductContent.tsp";
import "./capabilities/pricing/ProductPricing.tsp";
import "./capabilities/packages/ProductPackages.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const BOOKING_CANCELLATION_EXAMPLE = #{ ...Octo.BOOKING_CANCELLATION_EXAMPLE };

@example(BOOKING_CANCELLATION_EXAMPLE)
model BookingCancellation extends Octo.BookingCancellation {
  /**
   * An RFC 3339 date time in UTC indicating when the booking was cancelled.
   */
  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  utcCancelledAt: utcDateTime;
}
