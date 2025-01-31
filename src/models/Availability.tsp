import "./OpeningHours.tsp";
import "./AvailabilityStatus.tsp";
import "./capabilities/pricing/AvailabilityPricing.tsp";
import "./capabilities/content/AvailabilityContent.tsp";

namespace Octo;

const AVAILABILITY_ID_DOC = "A unique identifier for this availability. This ID is used during booking and must be unique within the scope of an option.";
const AVAILABILITY_LOCAL_DATE_TIME_START_DOC = "The start time for this availability in the product’s local time zone. This value must conform to ISO 8601 standards (e.g., \"2024-11-17T09:00:00+00:00\").";
const AVAILABILITY_LOCAL_DATE_TIME_END_DOC = "The end time for this availability in the product’s local time zone. It must also adhere to ISO 8601 standards.";
const AVAILABILITY_UTC_CUTOFF_AT_DOC = "The time by which the booking must be confirmed at";
const AVAILABILITY_ALL_DAY_DOC = "Indicates if this availability spans the entire day. If set to true, there will be no specific start or end times for this availability.";
const AVAILABILITY_AVAILABLE_DOC = "Indicates if there are remaining slots available for this date or time slot.";
const AVAILABILITY_STATUS_DOC = """
  Defines the current status of the availability:
  AVAILABLE: Open for booking.
  FREESALE: Unlimited availability, no capacity limits.
  SOLD_OUT: No spots available.
  LIMITED: Less than 50% capacity remaining.
  CLOSED: The availability is closed.
  """;
const AVAILABILITY_VACANCIES_DOC = "Specifies the number of available slots remaining. Should be nulled or omitted when status is FREESALE. If availability is tracked per unit, this represents the maximum remaining quantity across all units.";
const AVAILABILITY_CAPACITY_DOC = "The total capacity for this availability.";
const AVAILABILITY_MAX_UNITS_DOC = "The maximum number of units that can be sold in a single booking during this availability slot.";
const AVAILABILITY_OPENING_HOURS_DOC = OPENING_HOURS_DOC;

const AVAILABILITY_ID_EXAMPLE = "2022-05-23T00:00:00+01:00";
const AVAILABILITY_LOCAL_DATE_TIME_START_EXAMPLE = "2022-05-23T00:00:00+01:00";
const AVAILABILITY_LOCAL_DATE_TIME_END_EXAMPLE = "2022-05-24T00:00:00+01:00";
const AVAILABILITY_UTC_CUTOFF_AT_EXAMPLE = utcDateTime.fromISO("2022-05-22T23:00:00Z");
const AVAILABILITY_ALL_DAY_EXAMPLE = false;
const AVAILABILITY_AVAILABLE_EXAMPLE = true;
const AVAILABILITY_STATUS_EXAMPLE = AvailabilityStatus.AVAILABLE;
const AVAILABILITY_VACANCIES_EXAMPLE = 10;
const AVAILABILITY_CAPACITY_EXAMPLE = 10;
const AVAILABILITY_MAX_UNITS_EXAMPLE = null;
const AVAILABILITY_OPENING_HOURS_EXAMPLE = #[OPENING_HOURS_EXAMPLE];

const AVAILABILITY_EXAMPLE = #{
  id: AVAILABILITY_ID_EXAMPLE,
  localDateTimeStart: AVAILABILITY_LOCAL_DATE_TIME_START_EXAMPLE,
  localDateTimeEnd: AVAILABILITY_LOCAL_DATE_TIME_END_EXAMPLE,
  utcCutoffAt: AVAILABILITY_UTC_CUTOFF_AT_EXAMPLE,
  allDay: AVAILABILITY_ALL_DAY_EXAMPLE,
  available: AVAILABILITY_AVAILABLE_EXAMPLE,
  status: AVAILABILITY_STATUS_EXAMPLE,
  vacancies: AVAILABILITY_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CAPACITY_EXAMPLE,
  maxUnits: AVAILABILITY_MAX_UNITS_EXAMPLE,
  openingHours: AVAILABILITY_OPENING_HOURS_EXAMPLE,
};

@example(AVAILABILITY_EXAMPLE)
model Availability {
  @doc(AVAILABILITY_ID_DOC)
  @example(AVAILABILITY_ID_EXAMPLE)
  id: string;

  @doc(AVAILABILITY_LOCAL_DATE_TIME_START_DOC)
  @example(AVAILABILITY_LOCAL_DATE_TIME_START_EXAMPLE)
  localDateTimeStart: string;

  @doc(AVAILABILITY_LOCAL_DATE_TIME_END_DOC)
  @example(AVAILABILITY_LOCAL_DATE_TIME_END_EXAMPLE)
  localDateTimeEnd: string;

  @doc(AVAILABILITY_UTC_CUTOFF_AT_DOC)
  @example(AVAILABILITY_UTC_CUTOFF_AT_EXAMPLE)
  utcCutoffAt: utcDateTime;

  @doc(AVAILABILITY_ALL_DAY_DOC)
  @example(AVAILABILITY_ALL_DAY_EXAMPLE)
  allDay: boolean;

  @doc(AVAILABILITY_AVAILABLE_DOC)
  @example(AVAILABILITY_AVAILABLE_EXAMPLE)
  available: boolean;

  @doc(AVAILABILITY_STATUS_DOC)
  @example(AVAILABILITY_STATUS_EXAMPLE)
  status: AvailabilityStatus;

  @doc(AVAILABILITY_VACANCIES_DOC)
  @example(AVAILABILITY_VACANCIES_EXAMPLE)
  vacancies: integer | null;

  @doc(AVAILABILITY_CAPACITY_DOC)
  @example(AVAILABILITY_CAPACITY_EXAMPLE)
  capacity: integer | null;

  @doc(AVAILABILITY_MAX_UNITS_DOC)
  @example(AVAILABILITY_MAX_UNITS_EXAMPLE)
  maxUnits: integer | null;

  @doc(AVAILABILITY_OPENING_HOURS_DOC)
  @example(AVAILABILITY_OPENING_HOURS_EXAMPLE)
  openingHours: OpeningHours[];

  // capabilities
  ...AvailabilityPricing;

  ...AvailabilityContent;
}

const AVAILABILITY_START_TIME_EXAMPLE_1 = #{
  id: "2022-06-30T12:00:00+01:00",
  localDateTimeStart: "2022-06-30T12:00:00+01:00",
  localDateTimeEnd: "2022-06-30T14:00:00+01:00",
  allDay: false,
  available: true,
  status: AvailabilityStatus.AVAILABLE,
  vacancies: AVAILABILITY_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CAPACITY_EXAMPLE,
  maxUnits: AVAILABILITY_MAX_UNITS_EXAMPLE,
  utcCutoffAt: utcDateTime.fromISO("2022-06-29T22:00:00Z"),
  openingHours: #[],
};

const AVAILABILITY_START_TIME_EXAMPLE_2 = #{
  id: "2022-06-30T14:00:00+01:00",
  localDateTimeStart: "2022-06-30T14:00:00+01:00",
  localDateTimeEnd: "2022-06-30T16:00:00+01:00",
  allDay: false,
  available: true,
  status: AvailabilityStatus.AVAILABLE,
  vacancies: AVAILABILITY_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CAPACITY_EXAMPLE,
  maxUnits: AVAILABILITY_MAX_UNITS_EXAMPLE,
  utcCutoffAt: utcDateTime.fromISO("2022-06-29T22:00:00Z"),
  openingHours: #[],
};

const AVAILABILITY_OPENING_HOURS_EXAMPLE_1 = #{
  id: "2022-06-30T00:00:00+01:00",
  localDateTimeStart: "2022-06-30T00:00:00+01:00",
  localDateTimeEnd: "2022-07-01T00:00:00+01:00",
  allDay: true,
  available: true,
  status: AvailabilityStatus.FREESALE,
  vacancies: null,
  capacity: null,
  maxUnits: null,
  utcCutoffAt: utcDateTime.fromISO("2022-06-29T22:00:00Z"),
  openingHours: AVAILABILITY_OPENING_HOURS_EXAMPLE,
};

// Examples Capabilities

// octo/content

const AVAILABILITY_EXAMPLE_CONTENT = #{
  ...AVAILABILITY_OPENING_HOURS_EXAMPLE_1,
  ...AVAILABILITY_CONTENT_EXAMPLE,
};

// TODO: pricing capability examples
