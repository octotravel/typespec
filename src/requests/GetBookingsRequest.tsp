import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/GetBookingsSchema.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetBookingsRequest {
  @doc(GET_BOOKINGS_QUERY_RESELLER_REFERENCE_DOC)
  @query
  resellerReference?: string;

  @doc(GET_BOOKINGS_QUERY_SUPPLIER_REFERENCE_DOC)
  @query
  supplierReference?: string;

  @doc(GET_BOOKINGS_QUERY_LOCAL_DATE_DOC)
  @query
  localDate?: string;

  @doc(GET_BOOKINGS_QUERY_LOCAL_DATE_START_DOC)
  @query
  localDateStart?: string;

  @doc(GET_BOOKINGS_QUERY_LOCAL_DATE_END_DOC)
  @query
  localDateEnd?: string;

  @doc(GET_BOOKINGS_QUERY_PRODUCT_ID_DOC)
  @query
  productId?: string;

  @doc(GET_BOOKINGS_QUERY_OPTION_ID_DOC)
  @query
  optionId?: string;

  ...RequestHeaders;
}
