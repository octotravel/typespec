import "./OpeningHours.tsp";
import "./AvailabilityStatus.tsp";
import "./capabilities/pricing/AvailabilityPricing.tsp";

const AVAILABILITY_ID_DOC = "The availability id, you''ll need this when booking. MUST be a unique identifier within the scope of an option.";
const AVAILABILITY_LOCAL_DATE_TIME_START_DOC = "The start time for this availability. This will be in the local time zone of the product. Must be an `ISO 8601` compliant date and time.";
const AVAILABILITY_LOCAL_DATE_TIME_END_DOC = "The end time for this availability. This will be in the local time zone of the product. Must be an `ISO 8601` compliant date and time.";
const AVAILABILITY_UTC_CUTOFF_AT_DOC = "The time by which the booking must be confirmed at";
const AVAILABILITY_ALL_DAY_DOC = "A boolean field indicating whether this is an all day availability and not a fixed departure time. If this value is true then there will be no other availability object on the same day.";
const AVAILABILITY_AVAILABLE_DOC = "Whether there is availability for this date / slot.";
const AVAILABILITY_STATUS_DOC = "The status of that date. Possible values are:\n`AVAILABLE` This availability is available for sale\n`FREESALE` This availability has no capacity and is available.\n`SOLD_OUT` There are no more spots available for this date / slot.\n`LIMITED` This availability is available but has less than 50% capacity left.\n`CLOSED` Availability is closed for this day / slot.";
const AVAILABILITY_VACANCIES_DOC = "This SHOULD NOT be returned when status is `FREESALE`. This SHOULD be a shared pool for all Unit types in the Option. If availability is tracked per-Unit then this value MUST be equal to the available quantity for the Unit that has the most remaining.";
const AVAILABILITY_CAPACITY_DOC = "The total capacity on this day.";
const AVAILABILITY_MAX_UNITS_DOC = "Maximum number of units that can be sold within one booking on this day / slot.";
const AVAILABILITY_OPENING_HOURS_DOC = OPENING_HOURS_DOC;

const AVAILABILITY_ID_EXAMPLE = "2022-05-23T00:00:00+01:00";
const AVAILABILITY_LOCAL_DATE_TIME_START_EXAMPLE = "2022-05-23T00:00:00+01:00";
const AVAILABILITY_LOCAL_DATE_TIME_END_EXAMPLE = "2022-05-24T00:00:00+01:00";
const AVAILABILITY_UTC_CUTOFF_AT_EXAMPLE = "2022-05-22T23:00:00Z";
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
  utcCutoffAt: string;

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
  utcCutoffAt: "2022-06-30T10:00:00Z",
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
  utcCutoffAt: "2022-06-30T12:00:00Z",
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
  utcCutoffAt: "2022-06-29T22:00:00Z",
  openingHours: AVAILABILITY_OPENING_HOURS_EXAMPLE,
};
