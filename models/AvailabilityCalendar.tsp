import "./OpeningHours.tsp";
import "./AvailabilityStatus.tsp";
import "./capabilities/pricing/AvailabilityCalendarPricing.tsp";

const AVAILABILITY_CALENDAR_LOCAL_DATE_DOC = "The specific date for querying availability on Availability Calendar endpoint. This field must follow the ISO 8601 date format (e.g., 2024-11-18). It ensures standardized representation of dates across different systems.";
const AVAILABILITY_CALENDAR_AVAILABLE_DOC = """
  Indicates whether there is any remaining availability for the specified date.
  true: Availability exists.
  false: Fully booked or unavailable.
  """;
const AVAILABILITY_CALENDAR_STATUS_DOC = """
  Defines the current status of the availability date:
  AVAILABLE: Open for booking.
  FREESALE: Unlimited availability, no capacity limits.
  SOLD_OUT: No spots available.
  LIMITED: Less than 50% capacity remaining.
  CLOSED: The availability is closed.
  """;
const AVAILABILITY_CALENDAR_VACANCIES_DOC = "Specifies the number of available slots remaining quantity (highest remaining vacancies from all availabilities of this day). Should be nulled or omitted when status is FREESALE.";
const AVAILABILITY_CALENDAR_CAPACITY_DOC = "The total capacity for this availability date. ";
const AVAILABILITY_CALENDAR_OPENING_HOURS_DOC = OPENING_HOURS_DOC;

const AVAILABILITY_CALENDAR_LOCAL_DATE_EXAMPLE = "2022-05-12";
const AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE = true;
const AVAILABILITY_CALENDAR_STATUS_EXAMPLE = AvailabilityStatus.AVAILABLE;
const AVAILABILITY_CALENDAR_VACANCIES_EXAMPLE = 10;
const AVAILABILITY_CALENDAR_CAPACITY_EXAMPLE = 10;
const AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE = #[OPENING_HOURS_EXAMPLE];

const AVAILABILITY_CALENDAR_EXAMPLE = #{
  localDate: AVAILABILITY_CALENDAR_LOCAL_DATE_EXAMPLE,
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AVAILABILITY_STATUS_EXAMPLE,
  vacancies: AVAILABILITY_CALENDAR_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CALENDAR_CAPACITY_EXAMPLE,
  openingHours: AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE,
};

@example(AVAILABILITY_CALENDAR_EXAMPLE)
model AvailabilityCalendar {
  @doc(AVAILABILITY_CALENDAR_LOCAL_DATE_DOC)
  @example(AVAILABILITY_CALENDAR_LOCAL_DATE_EXAMPLE)
  localDate: string;

  @doc(AVAILABILITY_CALENDAR_AVAILABLE_DOC)
  @example(AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE)
  available: boolean;

  @doc(AVAILABILITY_CALENDAR_STATUS_DOC)
  @example(AVAILABILITY_CALENDAR_STATUS_EXAMPLE)
  status: AvailabilityStatus;

  @doc(AVAILABILITY_CALENDAR_VACANCIES_DOC)
  @example(AVAILABILITY_CALENDAR_VACANCIES_EXAMPLE)
  vacancies: integer | null;

  @doc(AVAILABILITY_CALENDAR_CAPACITY_DOC)
  @example(AVAILABILITY_CALENDAR_CAPACITY_EXAMPLE)
  capacity: integer | null;

  @doc(AVAILABILITY_OPENING_HOURS_DOC)
  @example(AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE)
  openingHours: OpeningHours[];

  // capabilities
  ...AvailabilityCalendarPricing;
}

const AVAILABILITY_CALENDAR_START_TIME_EXAMPLE_1 = #{
  localDate: "2022-06-14",
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AvailabilityStatus.AVAILABLE,
  vacancies: AVAILABILITY_CALENDAR_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CALENDAR_CAPACITY_EXAMPLE,
  openingHours: #[],
};

const AVAILABILITY_CALENDAR_START_TIME_EXAMPLE_2 = #{
  localDate: "2022-06-15",
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AvailabilityStatus.AVAILABLE,
  vacancies: AVAILABILITY_CALENDAR_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CALENDAR_CAPACITY_EXAMPLE,
  openingHours: #[],
};

const AVAILABILITY_CALENDAR_START_TIME_EXAMPLE_3 = #{
  localDate: "2022-06-16",
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AvailabilityStatus.AVAILABLE,
  vacancies: AVAILABILITY_CALENDAR_VACANCIES_EXAMPLE,
  capacity: AVAILABILITY_CALENDAR_CAPACITY_EXAMPLE,
  openingHours: #[],
};

const AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE_1 = #{
  localDate: "2022-06-14",
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AvailabilityStatus.FREESALE,
  vacancies: null,
  capacity: null,
  openingHours: AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE,
};

const AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE_2 = #{
  localDate: "2022-06-15",
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AvailabilityStatus.FREESALE,
  vacancies: null,
  capacity: null,
  openingHours: AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE,
};

const AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE_3 = #{
  localDate: "2022-06-16",
  available: AVAILABILITY_CALENDAR_AVAILABLE_EXAMPLE,
  status: AvailabilityStatus.FREESALE,
  vacancies: null,
  capacity: null,
  openingHours: AVAILABILITY_CALENDAR_OPENING_HOURS_EXAMPLE,
};
