import "./Pricing.tsp";
import "../../Unit.tsp";

const PRICING_UNIT_UNIT_ID_DOC = "ID of the unit this pricing is related to";

const PRICING_UNIT_UNIT_ID_EXAMPLE = UNIT_ID_ADULT;

@example(PRICING_UNIT_ADULT_EXAMPLE_EUR)
model PricingUnit extends Pricing {
  @doc(PRICING_UNIT_UNIT_ID_DOC)
  @example(PRICING_UNIT_UNIT_ID_EXAMPLE)
  unitId: string;
}

const PRICING_UNIT_ADULT_EXAMPLE_EUR = #{
  unitId: UNIT_ID_ADULT,
  ...PRICING_ADULT_EXAMPLE_EUR,
};

const PRICING_UNIT_CHILD_EXAMPLE_EUR = #{
  unitId: UNIT_ID_CHILD,
  ...PRICING_CHILD_EXAMPLE_EUR,
};

const PRICING_UNIT_INFANT_EXAMPLE_EUR = #{
  unitId: UNIT_ID_INFANT,
  ...PRICING_INFANT_EXAMPLE_EUR
};