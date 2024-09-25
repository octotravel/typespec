import "./OpeningHours.tsp";
import "./AvailabilityStatus.tsp";
import "./capabilities/pricing/AvailabilityCalendarPricing.tsp";

const AVAILABILITY_CALENDAR_LOCAL_DATE_DOC = "A single date to query. Must be ISO 8601 compliant date.";
const AVAILABILITY_CALENDAR_AVAILABLE_DOC = "Whether there is availability for this date / slot.";
const AVAILABILITY_CALENDAR_STATUS_DOC = "The status of that date. Possible values are:\n`AVAILABLE` This availability is available for sale\n`FREESALE` This availability has no capacity and is available.\n`SOLD_OUT` There are no more spots available for this date / slot.\n`LIMITED` This availability is available but has less than 50% capacity left.\n`CLOSED` Availability is closed for this day / slot.";
const AVAILABILITY_CALENDAR_VACANCIES_DOC = "This SHOULD NOT be returned when status is `FREESALE`. This SHOULD be a shared pool for all Unit types in the Option. If availability is tracked per-Unit then this value MUST be equal to the available quantity for the Unit that has the most remaining.";
const AVAILABILITY_CALENDAR_CAPACITY_DOC = "The total capacity on this day.";
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
