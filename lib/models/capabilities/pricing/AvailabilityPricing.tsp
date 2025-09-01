import "@typespec/openapi";
import "./Pricing.tsp";
import "./PricingUnit.tsp";

namespace Octo;
using OpenAPI;

const AVAILABILITY_PRICING_UNIT_PRICING_DOC = "Is on the object when Pricing capability is requested. ";
const AVAILABILITY_PRICING_PRICING_DOC = "Is on the object when Pricing capability is requested. ";

const AVAILABILITY_PRICING_UNIT_PRICING_EXAMPLE = #[
  PRICING_UNIT_ADULT_EXAMPLE_EUR,
  PRICING_UNIT_CHILD_EXAMPLE_EUR,
  PRICING_UNIT_INFANT_EXAMPLE_EUR
];
const AVAILABILITY_PRICING_PRICING_EXAMPLE = PRICING_GROUP_EUR;

const AVAILABILITY_PRICING_EXAMPLE = #{
  unitPricing: AVAILABILITY_PRICING_UNIT_PRICING_EXAMPLE,
  pricing: AVAILABILITY_PRICING_PRICING_EXAMPLE,
};

@example(AVAILABILITY_PRICING_EXAMPLE)
model AvailabilityPricing {
  @doc(AVAILABILITY_PRICING_UNIT_PRICING_DOC)
  @example(AVAILABILITY_PRICING_UNIT_PRICING_EXAMPLE)
  @extension(
    "x-capability-data",
    #{
      capability: "octo/pricing",
      required: true,
    }
  )
  unitPricing?: PricingUnit[];

  @doc(AVAILABILITY_PRICING_PRICING_DOC)
  @example(AVAILABILITY_PRICING_PRICING_EXAMPLE)
  @extension(
    "x-capability-data",
    #{
      capability: "octo/pricing",
      required: true,
    }
  )
  pricing?: Pricing;
}
