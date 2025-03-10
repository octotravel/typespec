import "@typespec/http";
import "@typespec/openapi";

import "./src/models/Product.tsp";
import "./src/models/Supplier.tsp";
import "./src/models/Booking.tsp";
import "./src/models/Availability.tsp";
import "./src/models/AvailabilityCalendar.tsp";

import "./src/responses/GetSupplierResponse.tsp";
import "./src/requests/GetSupplierRequest.tsp";

import "./src/responses/GetProductResponse.tsp";
import "./src/requests/GetProductRequest.tsp";

import "./src/requests/GetProductsRequest.tsp";
import "./src/responses/GetProductsResponse.tsp";

import "./src/requests/AvailabilityCheckRequest.tsp";
import "./src/responses/AvailabilityCheckResponse.tsp";

import "./src/requests/AvailabilityCalendarRequest.tsp";
import "./src/responses/AvailabilityCalendarResponse.tsp";

import "./src/requests/BookingReservationRequest.tsp";
import "./src/responses/BookingReservationResponse.tsp";

import "./src/requests/GetBookingsRequest.tsp";
import "./src/responses/GetBookingsResponse.tsp";

import "./src/requests/BookingConfirmationRequest.tsp";
import "./src/responses/BookingConfirmationResponse.tsp";

import "./src/requests/BookingCancellationRequest.tsp";
import "./src/responses/BookingCancellationResponse.tsp";

import "./src/requests/GetBookingRequest.tsp";
import "./src/responses/GetBookingResponse.tsp";

import "./src/requests/BookingUpdateRequest.tsp";
import "./src/responses/BookingUpdateResponse.tsp";

import "./src/requests/ExtendReservationRequest.tsp";
import "./src/responses/ExtendReservationResponse.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Octo;

@server("https://ventrata-api-1011165921260.us-central1.run.app/api/octo", "")
@server("http://localhost:8080/api/octo", "")
@useAuth(BearerAuth)
@service({
  title: "OCTO API Specification",
})
namespace Octo;

const ACCEPT_LANGUAGE_DOC = "This optional request header allows to specify preferred languages for content in the response. A language code that specifies the language of the product content. This code must conform to the BCP 47 standard, following RFC 5646 and RFC 4647 specifications for language tags. Examples include en-US for American English, fr-FR for French (France), and es-ES for Spanish (Spain). This header supports a comma-separated list of language tags with optional quality values (q) to indicate priority, such as en-US, fr-CA;q=0.8, fr;q=0.7, which prioritizes U.S. English, followed by Canadian French, and general French. This header is defined in the HTTP/1.1 specification (RFC 7231) and is commonly used for internationalized websites and services to enhance user experience. For more details, visit MDN Web Docs: Accept-Language - HTTP | MDN. Note this only determines preference and does not guarantee location has content available in the desired language.";

@tag("Supplier")
@route("/supplier")
interface Suppliers {
  @route("/")
  @summary("Get Supplier")
  @doc("Returns the supplier and associated contact details.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/content",
        statusCode: 200,
        body: GET_SUPPLIER_CONTENT_RESPONSE,
      },
    },
    #{
      title: "Supplier with octo/content",
      description: "Supplier with octo/content",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_SUPPLIER_RESPONSE,
      },
    },
    #{ title: "Supplier example", description: "Supplier example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_SUPPLIER_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_SUPPLIER_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_SUPPLIER_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  get(
    ...GetSupplierRequest,
  ): GetSupplierSuccessResponse | GetSupplierErrorResponse;
}

@tag("Products")
@route("/products")
interface Products {
  @route("/")
  @summary("Get Products")
  @doc("Fetch the list of products.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/pricing",
        statusCode: 200,
        body: GET_PRODUCTS_PRICING_PER_BOOKING_RESPONSE,
      },
    },
    #{
      title: "Products with octo/pricng (pricing per booking)",
      description: "Products with octo/pricng (pricing per booking)",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/pricing",
        statusCode: 200,
        body: GET_PRODUCTS_PRICING_PER_UNIT_RESPONSE,
      },
    },
    #{
      title: "Products with octo/pricng (pricing per unit)",
      description: "Products with octo/pricng (pricing per unit)",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/content",
        statusCode: 200,
        body: GET_PRODUCTS_CONTENT_RESPONSE,
      },
    },
    #{
      title: "Products with octo/content",
      description: "Products with octo/content",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_PRODUCTS_RESPONSE,
      },
    },
    #{ title: "Products example", description: "Products example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  GetProducts(
    ...GetProductsRequest,
  ): GetProductsSuccessResponse | GetProductsErrorResponse;

  @route("/{id}")
  @summary("Get Product")
  @doc("Fetch the product for the given id.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/pricing",
        statusCode: 200,
        body: GET_PRODUCT_PRICING_PER_BOOKING_RESPONSE,
      },
    },
    #{
      title: "Product with octo/pricng (pricing per booking)",
      description: "Product with octo/pricng (pricing per booking)",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/pricing",
        statusCode: 200,
        body: GET_PRODUCT_PRICING_PER_UNIT_RESPONSE,
      },
    },
    #{
      title: "Product with octo/pricng (pricing per unit)",
      description: "Product with octo/pricng (pricing per unit)",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/content",
        statusCode: 200,
        body: GET_PRODUCT_CONTENT_RESPONSE,
      },
    },
    #{
      title: "Product with octo/content",
      description: "Product with octo/content",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_PRODUCT_RESPONSE,
      },
    },
    #{ title: "Product example", description: "Product example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Product Id Response",
      description: "Invalid Product Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  GetProduct(
    ...GetProductRequest,
  ): GetProductSuccessResponse | GetProductErrorResponse;
}

@tag("Availability")
@route("/availability")
interface Availabilities {
  @route("/")
  @post
  @summary("Availability Check")
  @doc("This endpoint is slightly slower as it will return an object for each individual departure time (or day). You have to perform this step to retrieve an `availabilityId` in order to confirm a sale, so if you just want to use this endpoint and skip the calendar endpoint then that's perfectly ok.\n\nYou must pass in one of the following combinations of parameters for this endpoint:\n- `localDate`\n- `localeDateStart` and `localDateEnd`\n- `availabilityIds`")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "octo/content",
        statusCode: 200,
        body: AVAILABILITY_CHECK_CONTENT_RESPONSE,
      },
    },
    #{
      title: "Availability Check with octo/content",
      description: "Availability Check with octo/content",
    }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: AVAILABILITY_CHECK_START_TIMES_RESPONSE,
      },
    },
    #{ title: "Start Times Example", description: "Start Times Example" }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: AVAILABILITY_CHECK_OPENING_HOURS_RESPONSE,
      },
    },
    #{ title: "Opening Hours Example", description: "Opening Hours Example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CHECK_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Product Id Response",
      description: "Invalid Product Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CHECK_INVALID_OPTION_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Option Id Response",
      description: "Invalid Option Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CHECK_BAD_REQUEST_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Bad request response", description: "Bad request response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CHECK_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CHECK_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CHECK_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  AvailabilityCheck(
    ...AvailabilityCheckRequest,
  ): AvailabilityCheckSuccessResponse | AvailabilityCheckErrorResponse;
  @route("/calendar")
  @doc("This endpoint is highly optimised and will return a single object per day. It's designed to be queried for large date ranges and the result is used to populate an availability calendar.\n\nWhen the end user selects an open date you can call on `/availability` endpoint to get the `availabilityId` to create the booking")
  @summary("Availability Calendar")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: AVAILABILITY_CALENDAR_START_TIMES_RESPONSE,
      },
    },
    #{ title: "Start Times Example", description: "Start Times Example" }
  )
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: AVAILABILITY_CALENDAR_OPENING_HOURS_RESPONSE,
      },
    },
    #{ title: "Opening Hours Example", description: "Opening Hours Example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CALENDAR_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Product Id Response",
      description: "Invalid Product Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CALENDAR_INVALID_OPTION_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Option Id Response",
      description: "Invalid Option Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CALENDAR_BAD_REQUEST_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Bad request response", description: "Bad request response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CALENDAR_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CALENDAR_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: AVAILABILITY_CALENDAR_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  AvailabilityCalendar(
    ...AvailabilityCalendarRequest,
  ): AvailabilityCalendarSuccessResponse | AvailabilityCalendarErrorResponse;
}

@tag("Bookings")
@route("/bookings")
interface Bookings {
  @post
  @route("/")
  @summary("Booking Reservation")
  @doc("Reserving availability when making a booking. The steps to make a reservation are:\n\n1. **Check Availability**: Check the availability on the [/availability](docs/octo/branches/main/5b08f5f75e75d-availability-check) endpoint to retrieve an `availabilityId`\n2. **Booking Reservation** (this step): Create a booking that reserves the availability while you collect payment and contact information from the customer. The booking will remain with status `ON_HOLD` until the booking is confirmed or the reservation hold expires.\n\nThe availability for the booking is held for the amount of time equal to the`expirationMinutes` parameter (if provided), up to an internal limit set by either the supplier or the OCTo provider. The `utc_expires_at` parameter in the response object will indicate when a reservtion will expire. A reservation can be extended by calling the [/bookings/{uuid}/extend](docs/octo/branches/main/2c7924ab9128f-extend-reservation) endpoint.\n\nA reserved booking can be confirmed after the customer finalizes their choice on the [/bookings/{uuid}/confirm](docs/octo/branches/main/614d1613b2d70-booking-confirmation) endpoint provided the reservation had not expired.\n")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: BOOKING_RESERVATION_RESPONSE,
      },
    },
    #{
      title: "ON_HOLD Booking example",
      description: "ON_HOLD Booking example",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Product Id Response",
      description: "Invalid Product Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_INVALID_OPTION_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Option Id Response",
      description: "Invalid Option Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_INVALID_UNIT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Unit Id Response",
      description: "Invalid Unit Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_INVALID_AVAILABILITY_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Availability Id Response",
      description: "Invalid Availability Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Unprocessable Entity Response",
      description: "Unprocessable Entity Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_RESERVATION_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  BookingReservation(
    ...BookingReservationRequest,
  ): BookingReservationSuccessResponse | BookingReservationErrorResponse;
  @get
  @route("/")
  @summary("Get Bookings")
  @doc("This endpoint will fetch the bookings you have made for the given filters.\n\nWhen using this endpoint you must include one of the following query parameters:\n\n- `resellerReference`\n- `supplierReference`\n- `localDate`\n- `localDateStart` and `localDateEnd`")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_BOOKINGS_RESPONSE,
      },
    },
    #{ title: "Bad Request Response", description: "Bad Request Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKINGS_BAD_REQUEST_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Bad Request Response", description: "Bad Request Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKINGS_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKINGS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKINGs_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  GetBookings(
    ...GetBookingsRequest,
  ): GetBookingsSuccessResponse | GetBookingsErrorResponse;
  @post
  @summary("Booking Confirmation")
  @route("/{uuid}/confirm")
  @doc("This endpoint confirms the booking so it's ready to be used.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: BOOKING_CONFIRMATION_RESPONSE,
      },
    },
    #{
      title: "CONFIRMED Booking example",
      description: "CONFIRMED Booking example",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Product Id Response",
      description: "Invalid Product Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_INVALID_OPTION_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Option Id Response",
      description: "Invalid Option Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_INVALID_UNIT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Unit Id Response",
      description: "Invalid Unit Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_INVALID_AVAILABILITY_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Availability Id Response",
      description: "Invalid Availability Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Booking UUID Response",
      description: "Invalid Booking UUID Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Unprocessable Entity Response",
      description: "Unprocessable Entity Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CONFIRMATION_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  BookingConfirmation(
    ...BookingConfirmationRequest,
  ): BookingConfirmationSuccessResponse | BookingConfirmationErrorResponse;
  @post
  @summary("Booking Cancellation")
  @route("/{uuid}/cancel")
  @doc("For cancelling bookings. You can only cancel a booking if `booking.cancellable` is `TRUE`, and is within the booking cancellation cut-off window.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: BOOKING_CANCELLATION_RESPONSE,
      },
    },
    #{
      title: "CANCELLED Booking example",
      description: "CANCELLED Booking example",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CANCELLATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Booking UUID Response",
      description: "Invalid Booking UUID Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CANCELLATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Unprocessable Entity Response",
      description: "Unprocessable Entity Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CANCELLATION_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CANCELLATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: BOOKING_CANCELLATION_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  BookingCancellation(
    ...BookingCancellationRequest,
  ): BookingCancellationSuccessResponse | BookingCancellationErrorResponse;
  @get
  @route("/")
  @summary("Get Booking")
  @doc("Fetch the status of an existing booking.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_BOOKING_RESPONSE,
      },
    },
    #{ title: "Booking example", description: "Booking example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKING_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Booking UUID Response",
      description: "Invalid Booking UUID Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKING_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKING_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_BOOKING_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  GetBooking(
    ...GetBookingRequest,
  ): GetBookingSuccessResponse | GetBookingErrorResponse;
  @patch
  @route("/")
  @summary("Booking Update")
  @doc("Updates a booking before and after it has been confirmed as long as it hasn''t been redeemed or within the cancellation cutoff window. To know if the booking can be updated check the booking''s `cancellable` field. If the booking can be cancelled, it can also be updated. It''s generally preferred to update a booking rather than cancelling it and rebooking")
  BookingUpdate(
    ...BookingUpdateRequest,
  ): BookingUpdateSuccessResponse | BookingUpdateErrorResponse;
  @post
  @route("/{uuid}/extend")
  @summary("Extend Reservation")
  @doc("Use this endpoint to hold the availability for a booking longer if the status is `ON_HOLD`.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: EXTEND_RESERVATION_RESPONSE,
      },
    },
    #{
      title: "ON_HOLD Booking example",
      description: "ON_HOLD Booking example",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: EXTEND_RESERVATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Booking UUID Response",
      description: "Invalid Booking UUID Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: EXTEND_RESERVATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Unprocessable Entity Response",
      description: "Unprocessable Entity Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: EXTEND_RESERVATION_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: EXTEND_RESERVATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: EXTEND_RESERVATION_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  ExtendReservation(
    ...ExtendReservationRequest,
  ): ExtendReservationSuccessResponse | ExtendReservationErrorResponse;
}

