import "./DeliveryFormat.tsp";

const DELIVERY_FORMAT_DOC = "The format for the delivery option possible values are:\n`QRCODE` You should generate the QR Code yourself on a ticket.\n`PDF_URL` Where you use the generated tickets as a PDF.";
const DELIVERY_VALUE_DOC = "The format for the delivery option possible values are:\n`QRCODE` You should generate the QR Code yourself on a ticket.\n`PDF_URL` Where you use the generated tickets as a PDF.\n";

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
