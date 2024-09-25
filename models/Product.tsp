import "./AvailabilityType.tsp";
import "./Option.tsp";
import "./RedemptionMethod.tsp";
import "./DeliveryFormat.tsp";
import "./DeliveryMethod.tsp";
import "./capabilities/pricing/ProductPricing.tsp";

const PRODUCT_ID_DOC = "The id used for checking for availability and creating bookings for the product. This MUST be unique within the scope of the Supplier.";
const PRODUCT_INTERNAL_NAME_DOC = "The name the supplier calls the product.";
const PRODUCT_REFERENCE_DOC = "An optional code this supplier might use to identify the product.";
const PRODUCT_LOCALE_DOC = "A language code indicating what language this product content is in. This MUST be a valid BCP 47 RFC 5646 RFC 4647 language tag.";
const PRODUCT_TIMEZONE_DOC = "The IANA TimeZone name this product is located in.";
const PRODUCT_ALLOW_FREESALE_DOC = "Whether a booking can be made for this product without having to query availability first.";
const PRODUCT_INSTANT_CONFIRMATION_DOC = "Whether bookings will be immediately confirmed when a sale is made, otherwise the supplier will later either accept or reject the booking. When instantConfirmation is set to false one should expect created bookings to first get into a PENDING state.";
const PRODUCT_INSTANT_DELIVERY_DOC = "This indicates whether the Reseller can expect immediate delivery of the customer's tickets. If `false` then the Reseller MUST be able to delay delivery of the tickets to the customer.";
const PRODUCT_AVAILABILITY_REQUIRED_DOC = "Whether an `availabilityId` is required when creating a booking. Without this the booking will be open-dated and not have a specified travel date.";
const PRODUCT_AVAILABILITY_TYPE_DOC = "What type of availability this product has, possible values are:\n`START_TIME` if there are fixed departure times which you must pick one. Typical for day tours or activities.\n`OPENING_HOURS` if you just select a date and can visit any time when the venue is open.";
const PRODUCT_DELIVERY_FORMATS_DOC = "An array of formats the API will deliver the tickets as. Possible values are:\n`QRCODE` A code to be presented as a QR CODE barcode\n`CODE128A` code to be presented as a CODE 128 barcode\n`PDF_URL` A URL to a PDF file which contains all the ticket details";
const PRODUCT_DELIVERY_METHODS_DOC = "How the formats described in `deliveryFormats` will be delivered in the booking response, possible values are:\n`TICKET`: Individually per unit in the order (i.e. single ticket for each person)\n`VOUCHER`: One ticket for the whole booking";
const PRODUCT_REDEMPTION_METHOD_DOC = "How the voucher can be redeemed. Possible values are:\n`MANIFEST` The guest name will be written down and they just need to show up\n`DIGITAL` The tickets/voucher must be scanned but can be on mobile\n`PRINT` The tickets/voucher must be printed and presented on arrival";
const PRODUCT_OPTIONS_DOC = "An array of all options for this product. All products must have at least one option.";

const PRODUCT_ID_EXAMPLE = "6b903d44-dc24-4ca4-ae71-6bde6c4f4854";
const PRODUCT_INTERNAL_NAME_EXAMPLE = "Amazon River Tour";
const PRODUCT_REFERENCE_EXAMPLE = "AMZN";
const PRODUCT_LOCALE_EXAMPLE = "en-GB";
const PRODUCT_TIMEZONE_EXAMPLE = "Europe/London";
const PRODUCT_ALLOW_FREESALE_EXAMPLE = true;
const PRODUCT_INSTANT_CONFIRMATION_EXAMPLE = true;
const PRODUCT_INSTANT_DELIVERY_EXAMPLE = true;
const PRODUCT_AVAILABILITY_REQUIRED_EXAMPLE = true;
const PRODUCT_AVAILABILITY_TYPE_EXAMPLE = AvailabilityType.START_TIME;
const PRODUCT_DELIVERY_FORMATS_EXAMPLE = #[DeliveryFormat.QRCODE];
const PRODUCT_DELIVERY_METHODS_EXAMPLE = #[DeliveryMethod.TICKET];
const PRODUCT_REDEMPTION_METHOD_EXAMPLE = RedemptionMethod.DIGITAL;
const PRODUCT_OPTIONS_EXAMPLE = #[OPTION_EXAMPLE];

const PRODUCT_EXAMPLE = #{
  id: PRODUCT_ID_EXAMPLE,
  internalName: PRODUCT_INTERNAL_NAME_EXAMPLE,
  reference: PRODUCT_REFERENCE_EXAMPLE,
  locale: PRODUCT_LOCALE_EXAMPLE,
  timeZone: PRODUCT_TIMEZONE_EXAMPLE,
  allowFreesale: PRODUCT_ALLOW_FREESALE_EXAMPLE,
  instantConfirmation: PRODUCT_INSTANT_CONFIRMATION_EXAMPLE,
  instantDelivery: PRODUCT_INSTANT_DELIVERY_EXAMPLE,
  availabilityRequired: PRODUCT_AVAILABILITY_REQUIRED_EXAMPLE,
  availabilityType: PRODUCT_AVAILABILITY_TYPE_EXAMPLE,
  deliveryFormats: PRODUCT_DELIVERY_FORMATS_EXAMPLE,
  deliveryMethods: PRODUCT_DELIVERY_METHODS_EXAMPLE,
  redemptionMethod: PRODUCT_REDEMPTION_METHOD_EXAMPLE,
  options: PRODUCT_OPTIONS_EXAMPLE,
};

@example(PRODUCT_EXAMPLE)
model Product {
  @doc(PRODUCT_ID_DOC)
  @example(PRODUCT_ID_EXAMPLE)
  id: string;

  @doc(PRODUCT_INTERNAL_NAME_DOC)
  @example(PRODUCT_INTERNAL_NAME_EXAMPLE)
  internalName: string;

  @doc(PRODUCT_REFERENCE_DOC)
  @example(PRODUCT_REFERENCE_EXAMPLE)
  reference: string | null;

  @doc(PRODUCT_LOCALE_DOC)
  @example(PRODUCT_LOCALE_EXAMPLE)
  locale: string;

  @doc(PRODUCT_TIMEZONE_DOC)
  @example(PRODUCT_TIMEZONE_EXAMPLE)
  timeZone?: string;

  @doc(PRODUCT_ALLOW_FREESALE_DOC)
  @example(PRODUCT_ALLOW_FREESALE_EXAMPLE)
  allowFreesale: boolean;

  @doc(PRODUCT_INSTANT_CONFIRMATION_DOC)
  @example(PRODUCT_INSTANT_CONFIRMATION_EXAMPLE)
  instantConfirmation: boolean;

  @doc(PRODUCT_INSTANT_DELIVERY_DOC)
  @example(PRODUCT_INSTANT_DELIVERY_EXAMPLE)
  instantDelivery: boolean;

  @doc(PRODUCT_AVAILABILITY_REQUIRED_DOC)
  @example(PRODUCT_AVAILABILITY_REQUIRED_EXAMPLE)
  availabilityRequired: boolean;

  @doc(PRODUCT_AVAILABILITY_TYPE_DOC)
  @example(PRODUCT_AVAILABILITY_TYPE_EXAMPLE)
  availabilityType: AvailabilityType;

  @doc(PRODUCT_DELIVERY_FORMATS_DOC)
  @example(PRODUCT_DELIVERY_FORMATS_EXAMPLE)
  deliveryFormats: DeliveryFormat[];

  @doc(PRODUCT_DELIVERY_METHODS_DOC)
  @example(PRODUCT_DELIVERY_METHODS_EXAMPLE)
  deliveryMethods: DeliveryMethod[];

  @doc(PRODUCT_REDEMPTION_METHOD_DOC)
  @example(PRODUCT_REDEMPTION_METHOD_EXAMPLE)
  redemptionMethod: RedemptionMethod;

  @doc(PRODUCT_OPTIONS_DOC)
  @example(PRODUCT_OPTIONS_EXAMPLE)
  options: Option[];
// capabilities
  ...ProductPricing;
}

const PRODUCT_EXAMPLE_PRICING_PER_BOOKING = #{
  ...PRODUCT_EXAMPLE,
  ...OPTION_EXAMPLE_PRICING_PER_BOOKING,
  ...PRODUCT_PRICING_PER_BOOKING,
};

const PRODUCT_EXAMPLE_PRICING_PER_UNIT = #{
  ...PRODUCT_EXAMPLE,
  ...OPTION_EXAMPLE_PRICING_PER_UNIT,
  ...PRODUCT_PRICING_PER_UNIT,
};