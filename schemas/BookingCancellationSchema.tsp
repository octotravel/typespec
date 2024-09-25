const BOOKING_CANCELLATION_SCHMEA_REASON_DOC = "A text value describing why the cancellation happened.";
const BOOKING_CANCELLATION_SCHMEA_FORCE_DOC = "Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false)";

const BOOKING_CANCELLATION_SCHMEA_REASON_EXAMPLE = "Customer Requested";
const BOOKING_CANCELLATION_SCHMEA_FORCE_EXAMPLE = false;

const BOOKING_CANCELLATION_BODY_EXAMPLE = #{
  reason: BOOKING_CANCELLATION_REASON_EXAMPLE,
};

@example(BOOKING_CANCELLATION_BODY_EXAMPLE)
model BookingCancellationBody {
  @doc(BOOKING_CANCELLATION_SCHMEA_REASON_DOC)
  @example(BOOKING_CANCELLATION_SCHMEA_FORCE_DOC)
  reason?: string;

  @doc(BOOKING_CANCELLATION_SCHMEA_FORCE_DOC)
  @example(BOOKING_CANCELLATION_SCHMEA_FORCE_EXAMPLE)
  force?: boolean;
}
