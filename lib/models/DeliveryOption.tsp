import "./DeliveryFormat.tsp";

const DELIVERY_FORMAT_DOC = """
  The format in which vouchers for this product are delivered. Each format specifies how the vouchers will be represented:
  QRCODE: A code presented as a QR Code, commonly used for scanning at entry points.
  CODE128: A linear barcode format widely used for retail and ticketing purposes.
  AZTECCODE: A two-dimensional barcode format similar to QR codes but more compact. It is optimized for small spaces and often used in transportation and event ticketing.
  PDF_URL: A URL linking to a downloadable PDF containing the complete ticket details for this product.
  PKPASS_URL: A URL for adding the ticket to Apple Wallet (Passbook) for easy access on iOS devices.
  This field ensures resellers can understand and integrate the appropriate ticket delivery formats specifically associated with this product."
  """;
const DELIVERY_VALUE_DOC = "The string with the value of the delivery option, e.g. value behind the QRCODE, CODE128, AZTECCODE, or URL hosting the file for PDF_URL or PKPASS_URL)";

const DELIVERY_FORMAT_EXAMPLE = DeliveryFormat.QRCODE;
const DELIVERY_VALUE_EXAMPLE = "";

const DELIVERY_OPTION_EXAMPLE = #{
  deliveryFormat: DeliveryFormat.QRCODE,
  deliveryValue: DELIVERY_VALUE_EXAMPLE,
};

@example(DELIVERY_OPTION_EXAMPLE)
model DeliveryOption {
  @doc(DELIVERY_FORMAT_DOC)
  @example(DELIVERY_FORMAT_EXAMPLE)
  deliveryFormat: DeliveryFormat;

  @doc(DELIVERY_VALUE_DOC)
  @example(DELIVERY_VALUE_EXAMPLE)
  deliveryValue: string;
}
