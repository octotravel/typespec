import "@typespec/openapi";

import "../../src/schemas/BookingCancellationBody.tsp";

namespace Ventrata;
using OpenAPI;

const BOOKING_CANCELLATION_BODY_EXAMPLE = #{
  ...Octo.BOOKING_CANCELLATION_BODY_EXAMPLE,
};

@example(BOOKING_CANCELLATION_BODY_EXAMPLE)
model BookingCancellationBody extends Octo.BookingCancellationBody {}
