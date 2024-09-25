import "./Tax.tsp";

const PRICING_ORIGINAL_DOC = "The original price for this product which will be the same or higher than the sale amount. Use this to show a discount has been applied e.g. $10 $8.50";
const PRICING_RETAIL_DOC = "The sale price you should charge your customers.";
const PRICING_NET_DOC = "The wholesale rate the supplier will charge you for this sale.";
const PRICING_CURRENCY_DOC = "The currency.";
const PRICING_CURRENCY_PRECISION_DOC = "All pricing is given in integers to avoid floating point rounding issues. e.g. USD = 2 and JPY = 0. To convert a price to decimal you should do: price / (10 ** currencyPrecision) where ** is to the power of e.g. Math.pow(10, currencyPrecision).";
const PRICING_INCLUDED_TAXES_DOC = "Any taxes included in the retail and/or net price.";

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
  currency: "USD"
};

const PRICING_CHILD_EXAMPLE_USD = #{
  ...PRICING_CHILD_EXAMPLE_EUR,
  currency: "USD"
};

const PRICING_INFANT_EXAMPLE_USD = #{
  ...PRICING_INFANT_EXAMPLE_EUR,
  currency: "USD"
};

const PRICING_GROUP_EUR = #{
  original: 2000,
  retail: 2000,
  net: 1600,
  currency: "EUR",
  currencyPrecision: 2,
  includedTaxes: #[],
};

const PRICING_GROUP_USD = #{
  ...PRICING_GROUP_EUR,
  currency: "USD",
};