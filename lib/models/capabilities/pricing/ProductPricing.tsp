import "@typespec/openapi";
import "./PricingPer.tsp";

namespace Octo;
using OpenAPI;

const PRODUCT_PRICING_DEFAULT_CURRENCY_DOC = "Is on the object when Pricing capability is requested. Default currency for this product, if you omit the currency parameter on future endpoints this is the value the reservation system will fallback to.";
const PRODUCT_PRICING_AVAILABLE_CURRENCIES_DOC = "Is on the object when Pricing capability is requested. All the possible currencies that we accept for this product.";
const PRODUCT_PRICING_PRICING_PER_DOC = "Is on the object when Pricing capability is requested. Indicates whether the pricing is per unit (most common), or per booking. Pricing which is per booking is common for private charters or group booking products where the price is the same regardless of how many tickets are purchased.";

const PRODUCT_PRICING_DEFAULT_CURRENCY_EXAMPLE = "USD";
const PRODUCT_PRICING_AVAILABLE_CURRENCIES_EXAMPLE = #["USD", "EUR"];
const PRODUCT_PRICING_PRICING_PER_EXAMPLE = PricingPer.UNIT;

@example(PRODUCT_PRICING_PER_BOOKING)
model ProductPricing {
  @doc(PRODUCT_PRICING_DEFAULT_CURRENCY_DOC)
  @example(PRODUCT_PRICING_DEFAULT_CURRENCY_EXAMPLE)
  @extension(
    "x-capability-data",
    #{
      capability: "octo/pricing",
      required: true,
    }
  )
  defaultCurrency?: string;

  @doc(PRODUCT_PRICING_AVAILABLE_CURRENCIES_DOC)
  @example(PRODUCT_PRICING_AVAILABLE_CURRENCIES_EXAMPLE)
  @extension(
    "x-capability-data",
    #{
      capability: "octo/pricing",
      required: true,
    }
  )
  availableCurrencies?: string[];

  @doc(PRODUCT_PRICING_PRICING_PER_DOC)
  @example(PRODUCT_PRICING_PRICING_PER_EXAMPLE)
  @extension(
    "x-capability-data",
    #{
      capability: "octo/pricing",
      required: true,
    }
  )
  pricingPer?: PricingPer;
}

const PRODUCT_PRICING_PER_BOOKING = #{
  defaultCurrency: PRODUCT_PRICING_DEFAULT_CURRENCY_EXAMPLE,
  availableCurrencies: PRODUCT_PRICING_AVAILABLE_CURRENCIES_EXAMPLE,
  pricingPer: PricingPer.BOOKING,
};

const PRODUCT_PRICING_PER_UNIT = #{
  defaultCurrency: PRODUCT_PRICING_DEFAULT_CURRENCY_EXAMPLE,
  availableCurrencies: PRODUCT_PRICING_AVAILABLE_CURRENCIES_EXAMPLE,
  pricingPer: PricingPer.UNIT,
};
