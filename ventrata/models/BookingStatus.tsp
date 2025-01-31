import "../../src/models/BookingStatus.tsp";

namespace Ventrata;

@example(BookingStatus.CONFIRMED)
enum BookingStatus {
  ...Octo.BookingStatus,
  NOSHOW,
  UPGRADED,
}
