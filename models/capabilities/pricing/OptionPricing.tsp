import "./Pricing.tsp";

const OPTION_PRICING_PRICING_FROM_DOC = "Is on the object when Pricing capability is requested. ";
const OPTION_PRICING_PRICING_DOC = "Is on the object when Pricing capability is requested. ";

const OPTION_PRICING_PRICING_FROM_EXAMPLE = #[PRICING_GROUP_EUR];
const OPTION_PRICING_PRICING_EXAMPLE = #[PRICING_GROUP_EUR];

const OPTION_PRICING_EXAMPLE = #{
  pricingFrom: OPTION_PRICING_PRICING_FROM_EXAMPLE,
  pricing: OPTION_PRICING_PRICING_EXAMPLE,
};

@example(OPTION_PRICING_EXAMPLE)
model OptionPricing {
  @doc(OPTION_PRICING_PRICING_FROM_DOC)
  @example(OPTION_PRICING_PRICING_FROM_EXAMPLE)
  pricingFrom?: Pricing[];

  @doc(OPTION_PRICING_PRICING_DOC)
  @example(OPTION_PRICING_PRICING_EXAMPLE)
  pricing?: Pricing[];
}

const OPTION_PRICING_PER_BOOKING = #{
  pricingFrom: PRICING_GROUP_EUR,
};

const OPTION_PRICING_PER_UNIT = #{
};