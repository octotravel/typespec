const EXTEND_RESERVATION_SCHMEA_EXPIRATION_MINUTES_DOC = BOOKING_RESERVATION_BODY_EXPIRATION_MINUTES_DOC;

const EXTEND_RESERVATION_SCHMEA_EXPIRATION_MINUTES_EXAMPLE = 15;

const EXTEND_RESERVATION_BODY_EXAMPLE = #{
  expirationMinutes: EXTEND_RESERVATION_SCHMEA_EXPIRATION_MINUTES_EXAMPLE,
};

@example(EXTEND_RESERVATION_BODY_EXAMPLE)
model ExtendReservationBody {
  expirationMinutes?: integer;
}
