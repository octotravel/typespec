import "../../src/schemas/ExtendReservationBody.tsp";

namespace Ventrata;

const EXTEND_RESERVATION_BODY_EXAMPLE = #{
  ...Octo.EXTEND_RESERVATION_BODY_EXAMPLE,
};

@example(EXTEND_RESERVATION_BODY_EXAMPLE)
model ExtendReservationBody extends Octo.ExtendReservationBody {}
