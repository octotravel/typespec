import "./Pricing.tsp";

const BOOKING_PRICING_PRICING_DOC = "Is on the object when Pricing capability is requested. ";

const BOOKING_PRICING_PRICING_EXAMPLE = PRICING_GROUP_EUR;

const BOOKING_PRICING_EXAMPLE = #{ pricing: BOOKING_PRICING_PRICING_EXAMPLE };

@example(BOOKING_PRICING_EXAMPLE)
model BookingPricing {
  @doc(BOOKING_PRICING_PRICING_DOC)
  @example(BOOKING_PRICING_PRICING_EXAMPLE)
  pricing?: Pricing;
}
