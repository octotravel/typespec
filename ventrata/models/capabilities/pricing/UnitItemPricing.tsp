import "@typespec/openapi";

import "../../../../src/models/capabilities/pricing/UnitItemPricing.tsp";
import "./Pricing.tsp";

namespace Ventrata;

using OpenAPI;

const UNIT_ITEM_PRICING_ADULT = #{ pricing: Octo.PRICING_ADULT_EXAMPLE_EUR };

@example(UNIT_ITEM_PRICING_ADULT)
model UnitItemPricing extends Octo.UnitItemPricing {
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
