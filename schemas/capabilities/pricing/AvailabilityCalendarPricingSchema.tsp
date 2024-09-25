const AVAILABILITY_CALENDAR_BODY_CURRENCY_DOC = "Can be used only when pricing capability is used.";
const AVAILABILITY_CALENDAR_BODY_CURRENCY_EXAMPLE = "USD";

model AvailabilityCalendarPricingBody {
  @doc(AVAILABILITY_CALENDAR_BODY_CURRENCY_DOC)
  @example(AVAILABILITY_CALENDAR_BODY_CURRENCY_EXAMPLE)
  currency?: string;
}
