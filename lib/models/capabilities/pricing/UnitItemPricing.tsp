import "@typespec/openapi";
import "./Pricing.tsp";

namespace Octo;
using OpenAPI;

const UNIT_ITEM_PRICING_PRICING_DOC = "Is on the object when Pricing capability is requested. ";

const UNIT_ITEM_PRICING_PRICING_EXAMPLE = PRICING_ADULT_EXAMPLE_EUR;

const UNIT_ITEM_PRICING_EXAMPLE = #{
  pricing: UNIT_ITEM_PRICING_PRICING_EXAMPLE,
};

@example(UNIT_ITEM_PRICING_EXAMPLE)
model UnitItemPricing {
  @doc(UNIT_ITEM_PRICING_PRICING_DOC)
  @example(UNIT_ITEM_PRICING_PRICING_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  pricing?: Pricing;
}

const UNIT_ITEM_PRICING_ADULT_EUR = #{ pricing: PRICING_ADULT_EXAMPLE_EUR };

const UNIT_ITEM_PRICING_CHILD_EUR = #{ pricing: PRICING_CHILD_EXAMPLE_EUR };

const UNIT_ITEM_PRICING_INFANT_EUR = #{ pricing: PRICING_INFANT_EXAMPLE_EUR };
