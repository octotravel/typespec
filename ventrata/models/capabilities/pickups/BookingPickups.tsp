import "@typespec/openapi";

import "./PickupPoint.tsp";

using OpenAPI;

namespace Ventrata;

const BOOKING_PICKUPS_PICKUP_REQUESTED_EXAMPLE = true;
const BOOKING_PICKUPS_PICKUP_ID_EXAMPLE = "";
const BOOKING_PICKUPS_PICKUP_HOTEL_EXAMPLE = "";
const BOOKING_PICKUPS_PICKUP_ROOM_EXAMPLE = "";
const BOOKING_PICKUPS_PICKUP_NOTES_EXAMPLE = "";
const BOOKING_PICKUPS_PICKUP_POINT_EXAMPLE = null;

const BOOKING_PICKUPS_EXAMPLE = #{
  pickupRequested: BOOKING_PICKUPS_PICKUP_REQUESTED_EXAMPLE,
  pickupId: BOOKING_PICKUPS_PICKUP_ID_EXAMPLE,
  pickupHotel: BOOKING_PICKUPS_PICKUP_HOTEL_EXAMPLE,
  pickupRoom: BOOKING_PICKUPS_PICKUP_ROOM_EXAMPLE,
  pickupNotes: BOOKING_PICKUPS_PICKUP_NOTES_EXAMPLE,
  pickupPoint: BOOKING_PICKUPS_PICKUP_POINT_EXAMPLE,
};

@example(BOOKING_PICKUPS_EXAMPLE)
model BookingPickups {
  /**
   * Whether the booking requires a pickup. This field is only present when octo/pickups capability is requested.
   */
  @example(BOOKING_PICKUPS_PICKUP_REQUESTED_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  pickupRequested?: boolean;

  /**
   * The pickup ID that identifies the pickup in the booking system to make this reservation. This field is only present when octo/pickups capability is requested.
   */
  @example(BOOKING_PICKUPS_PICKUP_ID_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @format("uuid")
  pickupId?: string | null;

  /**
   * A hotel name and address that will be included in the booking.
   * This field is only present when octo/pickups capability is requested.
   *
   */
  @example(BOOKING_PICKUPS_PICKUP_HOTEL_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  pickupHotel?: string | null;

  /**
   * A room number in the pickup hotel.
   * This field is only present when octo/pickups capability is requested.
   *
   */
  @example(BOOKING_PICKUPS_PICKUP_ROOM_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  pickupRoom?: string | null;

  /**
   * Optional notes for the pickup. This field is only present when octo/pickups capability is requested.
   */
  @example(BOOKING_PICKUPS_PICKUP_NOTES_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  pickupNotes?: string | null;

  /**
   * A pickup point that will be included in the booking. This field is only present when octo/pickups capability is requested.
   */
  @example(BOOKING_PICKUPS_PICKUP_POINT_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  pickupPoint?: PickupPoint | null;
}
