import "./Pricing.tsp";
import "./PricingUnit.tsp";

const AVAILABILITY_CALENDAR_PRICING_UNIT_PRICING_DOC = "Is on the object when Pricing capability is requested. ";
const AVAILABILITY_CALENDAR_PRICING_PRICING_DOC = "Is on the object when Pricing capability is requested. ";

const AVAILABILITY_CALENDAR_PRICING_UNIT_PRICING_EXAMPLE = #[PRICING_UNIT_ADULT_EXAMPLE_EUR, PRICING_UNIT_CHILD_EXAMPLE_EUR, PRICING_UNIT_INFANT_EXAMPLE_EUR];
const AVAILABILITY_CALENDAR_PRICING_PRICING_EXAMPLE = #[PRICING_GROUP_EUR];

const AVAILABILITY_CALENDAR_PRICING_EXAMPLE = #{
  unitPricingFrom: AVAILABILITY_CALENDAR_PRICING_UNIT_PRICING_EXAMPLE,
  pricingFrom: AVAILABILITY_CALENDAR_PRICING_PRICING_EXAMPLE,
};

@example(AVAILABILITY_CALENDAR_PRICING_EXAMPLE)
model AvailabilityCalendarPricing {
  @doc(AVAILABILITY_CALENDAR_PRICING_UNIT_PRICING_DOC)
  @example(AVAILABILITY_CALENDAR_PRICING_UNIT_PRICING_EXAMPLE)
  unitPricingFrom?: PricingUnit[];

  @doc(AVAILABILITY_CALENDAR_PRICING_PRICING_DOC)
  @example(AVAILABILITY_CALENDAR_PRICING_PRICING_EXAMPLE)
  pricingFrom?: Pricing[];
}