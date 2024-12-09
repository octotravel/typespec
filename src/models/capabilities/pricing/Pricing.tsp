import "./Tax.tsp";

namespace Octo;

const PRICING_ORIGINAL_DOC = "Represents the advertised marketing price, which must be equal to or higher than pricingFrom.retail. Typically used for strike-through pricing, it highlights the original or component-based value of the product when the retail price reflects a discount or bundled offer. For example, a package product combining multiple components (e.g., hotel + tour + meals) may have a total component value of $500 (original), while the bundled retail price is $400. In such cases, the original price is displayed to show savings.This field should only be shown when it is higher than pricingFrom.retail and must accurately reflect a valid reference price, ensuring transparency and trust.";
const PRICING_RETAIL_DOC = "The supplier’s recommended sale price, including all taxes and fees. This is the price charged to end customers and represents the total cost.";
const PRICING_NET_DOC = "The wholesale price charged to the reseller, including all taxes and fees. This price reflects the amount the reseller pays to the supplier.";
const PRICING_CURRENCY_DOC = "Specifies the currency used for the prices provided in the pricingFrom object. The value must adhere to ISO 4217 currency codes (e.g., USD, EUR, JPY) to ensure consistency across systems.";
const PRICING_CURRENCY_PRECISION_DOC = "All pricing is given in integers to avoid floating point rounding issues. e.g. USD = 2 and JPY = 0. To convert a price to decimal you should do: price / (10 ** currencyPrecision) where ** is to the power of e.g. Math.pow(10, currencyPrecision).";
const PRICING_INCLUDED_TAXES_DOC = "This field defines the number of decimal places used for the currency in the pricingFrom object, ensuring precise representation and preventing rounding errors during calculations. For example, in currencies like USD, which have a precision of 2, prices are expressed in cents (e.g., $45.00 is represented as 4500). In currencies like JPY, which have a precision of 0, prices are expressed as whole yen amounts (e.g., ¥4500 is represented as 4500). By aligning with the specific decimal requirements of different currencies, this field guarantees accurate pricing calculations and consistent handling across various currency formats.";

const PRICING_ORIGINAL_EXAMPLE = 3995;
const PRICING_RETAIL_EXAMPLE = 3995;
const PRICING_NET_EXAMPLE = 2996;
const PRICING_CURRENCY_EXAMPLE = "USD";
const PRICING_CURRENCY_PRECISION_EXAMPLE = 2;
const PRICING_INCLUDED_TAXES_EXAMPLE = #[TAX_EXAMPLE];

const PRICING_EXAMPLE = #{
  original: PRICING_ORIGINAL_EXAMPLE,
  retail: PRICING_RETAIL_EXAMPLE,
  net: PRICING_NET_EXAMPLE,
  currency: PRICING_CURRENCY_EXAMPLE,
  currencyPrecision: PRICING_CURRENCY_PRECISION_EXAMPLE,
  includedTaxes: PRICING_INCLUDED_TAXES_EXAMPLE,
};

@example(PRICING_EXAMPLE)
model Pricing {
  @doc(PRICING_ORIGINAL_DOC)
  @example(PRICING_ORIGINAL_EXAMPLE)
  original: integer;

  @doc(PRICING_RETAIL_DOC)
  @example(PRICING_RETAIL_EXAMPLE)
  retail: integer;

  @doc(PRICING_NET_DOC)
  @example(PRICING_NET_EXAMPLE)
  net: integer | null;

  @doc(PRICING_CURRENCY_DOC)
  @example(PRICING_CURRENCY_EXAMPLE)
  currency: string;

  @doc(PRICING_CURRENCY_PRECISION_DOC)
  @example(PRICING_CURRENCY_PRECISION_EXAMPLE)
  currencyPrecision: integer;

  @doc(PRICING_INCLUDED_TAXES_DOC)
  @example(PRICING_INCLUDED_TAXES_EXAMPLE)
  includedTaxes: Tax[];
}

const PRICING_ADULT_EXAMPLE_EUR = #{
  original: 1000,
  retail: 1000,
  net: 8000,
  currency: "EUR",
  currencyPrecision: 2,
  includedTaxes: #[],
};

const PRICING_CHILD_EXAMPLE_EUR = #{
  original: 500,
  retail: 500,
  net: 400,
  currency: "EUR",
  currencyPrecision: 2,
  includedTaxes: #[],
};

const PRICING_INFANT_EXAMPLE_EUR = #{
  original: 0,
  retail: 0,
  net: 0,
  currency: "EUR",
  currencyPrecision: 2,
  includedTaxes: #[],
};

const PRICING_ADULT_EXAMPLE_USD = #{
  ...PRICING_ADULT_EXAMPLE_EUR,
  currency: "USD",
};

const PRICING_CHILD_EXAMPLE_USD = #{
  ...PRICING_CHILD_EXAMPLE_EUR,
  currency: "USD",
};

const PRICING_INFANT_EXAMPLE_USD = #{
  ...PRICING_INFANT_EXAMPLE_EUR,
  currency: "USD",
};

const PRICING_GROUP_EUR = #{
  original: 2000,
  retail: 2000,
  net: 1600,
  currency: "EUR",
  currencyPrecision: 2,
  includedTaxes: #[],
};

const PRICING_GROUP_USD = #{ ...PRICING_GROUP_EUR, currency: "USD" };
