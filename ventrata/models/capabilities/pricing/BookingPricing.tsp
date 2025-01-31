import "@typespec/openapi";

import "../../../../src/models/capabilities/pricing/BookingPricing.tsp";
import "./Pricing.tsp";

namespace Ventrata;

using OpenAPI;

const BOOKING_PRICING_EXAMPLE = Octo.BOOKING_PRICING_EXAMPLE;

@example(BOOKING_PRICING_EXAMPLE)
model BookingPricing extends Octo.BookingPricing {
  @extension(
    "x-capability-data",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  pricing?: Pricing;
}
