import "./RedemptionMethod.tsp";
import "./DeliveryOption.tsp";

namespace Octo;

const TICKET_REDEMPTION_METHOD_DOC = """
  Specifies how the voucher can be redeemed by the customer:
  DIGITAL: The voucher must be presented, either scanned from a digital device (e.g., smartphone) or as a printed copy. Redemption requires a valid voucher or ticket, even in digital form.
  MANIFEST: The customer’s name, reference, or other information is checked against a manifest by the supplier. Redemption does not require a ticket or voucher.
  PRINT: A physical printed voucher is strictly required for redemption and must be presented at the time of use.
  This field ensures resellers and customers understand the specific requirements for redeeming this booking.
  """;
const TICKET_UTC_REDEEMED_AT_DOC = "An ISO8601 date time in UTC at when the voucher was redeemed, if applicable.";
const TICKET_DELIVERY_OPTIONS_DOC = "All possible delivery options supplier accepts, in the order of supplier preference";

const TICKET_REDEMPTION_METHOD_EXAMPLE = RedemptionMethod.DIGITAL;
const TICKET_UTC_REDEEMED_AT_EXAMPLE = "2021-10-27T23:28:43Z";
const TICKET_DELIVERY_OPTIONS_EXAMPLE = #[DELIVERY_OPTION_EXAMPLE];

const TICKET_EXAMPLE = #{
  redemptionMethod: TICKET_REDEMPTION_METHOD_EXAMPLE,
  utcRedeemedAt: TICKET_UTC_REDEEMED_AT_EXAMPLE,
  deliveryOptions: TICKET_DELIVERY_OPTIONS_EXAMPLE,
};

@example(TICKET_EXAMPLE)
model Ticket {
  @doc(TICKET_REDEMPTION_METHOD_DOC)
  @example(TICKET_REDEMPTION_METHOD_EXAMPLE)
  redemptionMethod: RedemptionMethod;

  @doc(TICKET_UTC_REDEEMED_AT_DOC)
  @example(TICKET_UTC_REDEEMED_AT_EXAMPLE)
  utcRedeemedAt: string | null;

  @doc(TICKET_DELIVERY_OPTIONS_DOC)
  @example(TICKET_DELIVERY_OPTIONS_EXAMPLE)
  deliveryOptions: DeliveryOption[];
}
