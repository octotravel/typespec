import "./AvailabilityType.tsp";
import "./Option.tsp";
import "./RedemptionMethod.tsp";
import "./DeliveryFormat.tsp";
import "./DeliveryMethod.tsp";
import "./capabilities/pricing/ProductPricing.tsp";

const PRODUCT_ID_DOC = "The unique identifier for the product, used across the platform to check availability, create bookings, etc. This identifier must be unique within the scope of the supplier’s system to ensure accurate referencing and operations.";
const PRODUCT_INTERNAL_NAME_DOC = "The internal name used by the supplier to refer to the product. This name is for internal or operational purposes and may differ from the public, customer-facing name. The customer-facing name is defined separately in the title field under the octo/content capability.";
const PRODUCT_REFERENCE_DOC = "An optional internal code used by the supplier to refer to the product. This field is useful for supplier-specific workflows or cross-referencing. It can be null if no reference code exists for the product.";
const PRODUCT_LOCALE_DOC = "The language code specifying the primary language in which the product operates. It must conform to the IETF BCP 47 standard, which defines language tags for localization (e.g., en-US for American English, fr-FR for French (France), es-ES for Spanish (Spain)).";
const PRODUCT_TIMEZONE_DOC = "The IANA Time Zone identifier indicating the product's location (e.g., America/New_York, Europe/London).";
const PRODUCT_ALLOW_FREESALE_DOC = "Indicates whether an availabilityId is required when creating a booking. If set to false, bookings can be made without specifying a travel date, creating open-dated bookings.";
const PRODUCT_INSTANT_CONFIRMATION_DOC = "Indicates whether the customer’s tickets or vouchers are delivered immediately after the booking is confirmed. If false, resellers must manage delayed ticket delivery processes.";
const PRODUCT_INSTANT_DELIVERY_DOC = "This indicates whether the Reseller can expect immediate delivery of the customer's tickets. If `false` then the Reseller MUST be able to delay delivery of the tickets to the customer.";
const PRODUCT_AVAILABILITY_REQUIRED_DOC = "Indicates whether an availabilityId is required when creating a booking. If set to false, bookings can be made without specifying a travel date, creating open-dated bookings.";
const PRODUCT_AVAILABILITY_TYPE_DOC = """
  Specifies the type of availability for the product:
  START_TIME: For products with fixed departure times (e.g., walking tour at set times during the day).
  OPENING_HOURS: For products where customers select a date and can visit anytime during operating hours (e.g., museums general admission ticket valid at any time when museum is open).
  """;
const PRODUCT_DELIVERY_FORMATS_DOC = """
  Lists the formats in which tickets or vouchers for this product are delivered. Each format specifies how the tickets or vouchers will be represented:
  QRCODE: A code presented as a QR Code, commonly used for scanning at entry points.
  CODE128: A linear barcode format widely used for retail and ticketing purposes.
  AZTECCODE: A two-dimensional barcode format similar to QR codes but more compact. It is optimized for small spaces and often used in transportation and event ticketing.
  PDF_URL: A URL linking to a downloadable PDF containing the complete ticket details for this product.
  PKPASS_URL: A URL for adding the ticket to Apple Wallet (Passbook) for easy access on iOS devices.
  This field ensures resellers can understand and integrate the appropriate ticket delivery formats specifically associated with this product.
  """;
const PRODUCT_DELIVERY_METHODS_DOC = """
  Specifies all supported methods of how tickets or vouchers for this product are delivered in the booking response:
  TICKET: Delivered individually per unit in the booking, where each person or unit receives a separate ticket.
  VOUCHER: Delivered as a single voucher for the entire booking, consolidating all units under one document.
  This field ensures clarity on the format of ticket or voucher delivery to resellers and customers.
  """;
const PRODUCT_REDEMPTION_METHOD_DOC = """
  Specifies how the product can be redeemed by the customer:
  DIGITAL: The ticket or voucher must be presented, either scanned from a digital device (e.g., smartphone) or as a printed copy. Redemption requires a valid voucher or ticket, even in digital form.
  MANIFEST: The customer’s name, reference, or other information is checked against a manifest by the supplier. Redemption does not require a ticket or voucher.
  PRINT: A physical printed ticket or voucher is strictly required for redemption and must be presented at the time of use.
  This field ensures resellers and customers understand the specific requirements for redeeming this product.
  """;
const PRODUCT_OPTIONS_DOC = "The list array of all options (variations of the product). Each product must have at lest one option. See Option for a detailed on the object.";

const PRODUCT_ID_EXAMPLE = "6b903d44-dc24-4ca4-ae71-6bde6c4f4854";
const PRODUCT_INTERNAL_NAME_EXAMPLE = "London Eye General Admission";
const PRODUCT_REFERENCE_EXAMPLE = "LEYE-GA";
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
