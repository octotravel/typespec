import "@typespec/http";
import "@typespec/openapi3";


namespace Octo;
using TypeSpec.Http;

model GetBookingsQuery {
  /**
   * The reseller reference on the booking
   */
  @query resellerReference?: string;

  /**
   * The reference provided by the supplier
   */
  @query supplierReference?: string;
}


model GetBookingsQueryParams {
  /**
   * The reseller reference on the booking
   */
  resellerReference?: string;

  /**
   * The reference provided by the supplier
   */
  supplierReference?: string;
}

