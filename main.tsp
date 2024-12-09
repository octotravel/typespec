import "@typespec/http";
import "@typespec/openapi";

import "./models/Product.tsp";
import "./models/Supplier.tsp";
import "./models/Booking.tsp";
import "./models/Availability.tsp";
import "./models/AvailabilityCalendar.tsp";

import "./responses/GetSupplierResponse.tsp";
import "./responses/GetProductResponse.tsp";
import "./responses/GetProductsResponse.tsp";

import "./schemas/AvailabilityCheckSchema.tsp";
import "./responses/AvailabilityCheckResponse.tsp";

import "./schemas/AvailabilityCalendarSchema.tsp";
import "./responses/AvailabilityCalendarResponse.tsp";

import "./schemas/BookingReservationSchema.tsp";
import "./responses/BookingReservationResponse.tsp";

import "./schemas/GetBookingsSchema.tsp";
import "./responses/GetBookingsResponse.tsp";

import "./schemas/BookingConfirmationSchema.tsp";
import "./responses/BookingConfirmationResponse.tsp";

import "./schemas/BookingCancellationSchema.tsp";
import "./responses/BookingCancellationResponse.tsp";

import "./responses/GetBookingResponse.tsp";

import "./schemas/BookingUpdateSchema.tsp";
import "./responses/BookingUpdateResponse.tsp";

import "./schemas/ExtendReservationSchema.tsp";
import "./responses/ExtendReservationResponse.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@server("https://ventrata-api-1011165921260.us-central1.run.app/api/octo", "")
@server("http://localhost:8080/api/octo", "")
@useAuth(BearerAuth)
@service({
  title: "OCTO API Specification",
})
namespace OCTOApi;

@tag("Supplier")
@route("/supplier")
interface Suppliers {
  @route("/")
  @summary("Get Supplier")
  @doc("Returns the supplier and associated contact details.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: GET_SUPPLIER_RESPONSE } },
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
  get(): GetSupplierSuccessResponse | GetSupplierErrorResponse;
}

@tag("Products")
@route("/products")
interface Products {
  @route("/")
  @summary("Get Products")
  @doc("Fetch the list of products.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: GET_PRODUCTS_RESPONSE } },
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
  GetProducts(): GetProductsSuccessResponse | GetProductsErrorResponse;

  @route("/{id}")
  @summary("Get Product")
  @doc("Fetch the product for the given id.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: GET_PRODUCT_RESPONSE } },
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
    @doc("The product id")
    @path
    id: string,
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
        statusCode: 200,
        body: AVAILABILITY_CHECK_START_TIMES_RESPONSE,
      },
    },
    #{ title: "Start Times Example", description: "Start Times Example" }
  )
  @opExample(
    #{
      returnType: #{
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
    @example(
      AVAILABILITY_CHECK_DATE_RANGE_BODY_EXAMPLE,
      #{ title: "Date Range example", description: "Date Range example" }
    )
    @example(
      AVAILABILITY_CHECK_AVAILABILITY_IDS_BODY_EXAMPLE,
      #{
        title: "Availability IDs example",
        description: "Availability IDs example",
      }
    )
    @example(
      AVAILABILITY_CHECK_WITH_UNITS_BODY_EXAMPLE,
      #{ title: "Example with units", description: "Example with units" }
    )
    @body
    body: AvailabilityCheckBody,
  ): AvailabilityCheckSuccessResponse | AvailabilityCheckErrorResponse;
  @route("/calendar")
  @doc("This endpoint is highly optimised and will return a single object per day. It's designed to be queried for large date ranges and the result is used to populate an availability calendar.\n\nWhen the end user selects an open date you can call on `/availability` endpoint to get the `availabilityId` to create the booking")
  @summary("Availability Calendar")
  @opExample(
    #{
      returnType: #{
        statusCode: 200,
        body: AVAILABILITY_CALENDAR_START_TIMES_RESPONSE,
      },
    },
    #{ title: "Start Times Example", description: "Start Times Example" }
  )
  @opExample(
    #{
      returnType: #{
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
    @example(
      AVAILABILITY_CALENDAR_DATE_RANGE_BODY_EXAMPLE,
      #{ title: "Date Range example", description: "Date Range example" }
    )
    @example(
      AVAILABILITY_CALENDAR_WITH_UNITS_BODY_EXAMPLE,
      #{ title: "Example with units", description: "Example with units" }
    )
    @body
    body: AvailabilityCalendarBody,
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
    #{ returnType: #{ statusCode: 200, body: BOOKING_RESERVATION_RESPONSE } },
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
    @example(
      BOOKING_RESRVATION_BODY_EXAMPLE,
      #{ title: "Reserve Booking", description: "Reserve Booking" }
    )
    @body
    body: BookingReservationBody,
  ): BookingReservationSuccessResponse | BookingReservationErrorResponse;
  @get
  @route("/")
  @summary("Get Bookings")
  @doc("This endpoint will fetch the bookings you have made for the given filters.\n\nWhen using this endpoint you must include one of the following query parameters:\n\n- `resellerReference`\n- `supplierReference`\n- `localDate`\n- `localDateStart` and `localDateEnd`")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: GET_BOOKINGS_RESPONSE } },
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
    @doc(GET_BOOKINGS_QUERY_RESELLER_REFERENCE_DOC)
    @query
    resellerReference?: string,

    @doc(GET_BOOKINGS_QUERY_SUPPLIER_REFERENCE_DOC)
    @query
    supplierReference?: string,

    @doc(GET_BOOKINGS_QUERY_LOCAL_DATE_DOC)
    @query
    localDate?: string,

    @doc(GET_BOOKINGS_QUERY_LOCAL_DATE_START_DOC)
    @query
    localDateStart?: string,

    @doc(GET_BOOKINGS_QUERY_LOCAL_DATE_END_DOC)
    @query
    localDateEnd?: string,

    @doc(GET_BOOKINGS_QUERY_PRODUCT_ID_DOC)
    @query
    productId?: string,

    @doc(GET_BOOKINGS_QUERY_OPTION_ID_DOC)
    @query
    optionId?: string,
  ): GetBookingsSuccessResponse | GetBookingsErrorResponse;
  @post
  @summary("Booking Confirmation")
  @route("/{uuid}/confirm")
  @doc("This endpoint confirms the booking so it's ready to be used.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: BOOKING_CONFIRMATION_RESPONSE } },
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
    @doc("The UUID of the booking")
    @path
    uuid: string,

    @example(
      BOOKING_CONFIRMATION_BODY_EXAMPLE,
      #{ title: "Confirmation", description: "Confirmation" }
    )
    @body
    body: BookingConfirmationBody,
  ): BookingConfirmationSuccessResponse | BookingConfirmationErrorResponse;
  @post
  @summary("Booking Cancellation")
  @route("/{uuid}/cancel")
  @doc("For cancelling bookings. You can only cancel a booking if `booking.cancellable` is `TRUE`, and is within the booking cancellation cut-off window.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: BOOKING_CANCELLATION_RESPONSE } },
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
    @doc("The UUID of the booking")
    @path
    uuid: string,

    @body body: BookingCancellationBody,
  ): BookingCancellationSuccessResponse | BookingCancellationErrorResponse;
  @get
  @route("/")
  @summary("Get Booking")
  @doc("Fetch the status of an existing booking.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: GET_BOOKING_RESPONSE } },
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
    @doc("The UUID of the booking")
    @path
    uuid: string,
  ): GetBookingSuccessResponse | GetBookingErrorResponse;
  @patch
  @route("/")
  @summary("Booking Update")
  @doc("Updates a booking before and after it has been confirmed as long as it hasn''t been redeemed or within the cancellation cutoff window. To know if the booking can be updated check the booking''s `cancellable` field. If the booking can be cancelled, it can also be updated. It''s generally preferred to update a booking rather than cancelling it and rebooking")
  BookingUpdate(
    @doc("The UUID of the booking")
    @path
    uuid: string,

    @body body: BookingUpdateBody,
  ): BookingUpdateSuccessResponse | BookingUpdateErrorResponse;
  @post
  @route("/{uuid}/extend")
  @summary("Extend Reservation")
  @doc("Use this endpoint to hold the availability for a booking longer if the status is `ON_HOLD`.")
  @opExample(
    #{ returnType: #{ statusCode: 200, body: EXTEND_RESERVATION_RESPONSE } },
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
    @doc("The UUID of the booking")
    @path
    uuid: string,

    @body body: ExtendReservationBody,
  ): ExtendReservationSuccessResponse | ExtendReservationErrorResponse;
}
