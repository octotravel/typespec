import "@typespec/openapi";
import "../../../../src/models/capabilities/pricing/ProductPricing.tsp";
import "../../../../src/models/capabilities/pricing/PricingPer.tsp";

namespace Ventrata;

using OpenAPI;

const PRODUCT_PRICING_TAX_INCLUDED_DOC = "Is on the object when Pricing capability is requested. Indicates whether the price includes tax or not.";
const PRODUCT_PRICING_TAX_INCLUDED_EXAMPLE = true;

const PRODUCT_PRICING_PER_BOOKING = #{
  ...Octo.PRODUCT_PRICING_PER_BOOKING,
  taxIncluded: true,
};

const PRODUCT_PRICING_PER_UNIT = #{
  ...Octo.PRODUCT_PRICING_PER_BOOKING,
  taxIncluded: true,
};

@example(PRODUCT_PRICING_PER_UNIT)
model ProductPricing extends Octo.ProductPricing {
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
  defaultCurrency?: string;

  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
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
  taxIncluded?: boolean;

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
  availableCurrencies?: string[];

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
  pricingPer?: Octo.PricingPer;
}
