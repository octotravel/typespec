namespace Octo;

const AVAILABILITY_BODY_CURRENCY_DOC = "Can be used only when pricing capability is used.";
const AVAILABILITY_BODY_CURRENCY_EXAMPLE = "USD";

model AvailabilityPricingBody {
  @doc(AVAILABILITY_BODY_CURRENCY_DOC)
  @example(AVAILABILITY_BODY_CURRENCY_EXAMPLE)
  currency?: string | null;
}
