import "./RedemptionMethod.tsp";
import "./DeliveryOption.tsp";

const TICKET_REDEMPTION_METHOD_DOC = "How the voucher can be redeemed. Possible values are:\n`MANIFEST` The guest name will be written down and they just need to show up\n`DIGITAL` The tickets/voucher must be scanned but can be on mobile\n`PRINT` The tickets/voucher must be printed and presented on arrival";
const TICKET_UTC_REDEEMED_AT_DOC = "The ISO8601 date in UTC indicating when the ticket was used at the attraction.";
const TICKET_DELIVERY_OPTIONS_DOC = "";

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

  @doc(TICKET_REDEMPTION_METHOD_DOC)
  @example(TICKET_UTC_REDEEMED_AT_EXAMPLE)
  utcRedeemedAt: string | null;

  @doc(TICKET_REDEMPTION_METHOD_DOC)
  @example(TICKET_DELIVERY_OPTIONS_EXAMPLE)
  deliveryOptions: DeliveryOption[];
}
