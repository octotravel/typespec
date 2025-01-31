import "@typespec/openapi";

import "../../../../src/models/capabilities/pricing/OptionPricing.tsp";
import "./Pricing.tsp";

namespace Ventrata;

using OpenAPI;

const OPTION_PRICING_PER_BOOKING = Octo.OPTION_PRICING_PER_BOOKING;

const OPTION_PRICING_PER_UNIT = Octo.OPTION_PRICING_PER_UNIT;

@example(OPTION_PRICING_PER_BOOKING)
model OptionPricing extends Octo.OptionPricing {
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
  pricing?: Pricing[];

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
  @extension("x-go-type-skip-optional-pointer", true)
  pricingFrom?: Pricing[];
}
