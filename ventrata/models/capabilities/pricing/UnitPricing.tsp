import "@typespec/openapi";

import "../../../../src/models/capabilities/pricing/UnitPricing.tsp";
import "./Pricing.tsp";

namespace Ventrata;

using OpenAPI;

const UNIT_PRICING_ADULT = #{
  pricingFrom: #[
    Octo.PRICING_ADULT_EXAMPLE_EUR,
    Octo.PRICING_ADULT_EXAMPLE_USD
  ],
};
const UNIT_PRICING_ADULT_FINAL = #{
  pricing: #[Octo.PRICING_ADULT_EXAMPLE_EUR, Octo.PRICING_ADULT_EXAMPLE_USD],
};

@example(UNIT_PRICING_ADULT)
model UnitPricing extends Octo.UnitPricing {
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
