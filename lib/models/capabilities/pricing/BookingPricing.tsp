import "@typespec/openapi";
import "./Pricing.tsp";

namespace Octo;
using OpenAPI;

const BOOKING_PRICING_PRICING_DOC = "Is on the object when Pricing capability is requested. ";

const BOOKING_PRICING_PRICING_EXAMPLE = PRICING_GROUP_EUR;

const BOOKING_PRICING_EXAMPLE = #{ pricing: BOOKING_PRICING_PRICING_EXAMPLE };

@example(BOOKING_PRICING_EXAMPLE)
model BookingPricing {
  @doc(BOOKING_PRICING_PRICING_DOC)
  @example(BOOKING_PRICING_PRICING_EXAMPLE)
  @extension(
    "x-capability-data",
    #{
      capability: "octo/pricing",
      required: true,
    }
  )
  pricing?: Pricing;
}
