import "@typespec/http";
import "@typespec/openapi3";

import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetBookingsRequest {
  /**
   * The reseller reference on the booking
   */
  @query resellerReference?: string;

  /**
   * The reference provided by the supplier
   */
  @query supplierReference?: string;

  /**
   * All bookings made for a specific date
   */
  @query localDate?: string;

  /**
   * First date of a date range search
   */
  @query localDateStart?: string;

  /**
   * Last date of a date range search
   */
  @query localDateEnd?: string;

  /**
   * The product id to filter by
   */
  @query productId?: string;

  /**
   * The option id to filter by
   */
  @query optionId?: string;

  ...RequestHeaders;
}
