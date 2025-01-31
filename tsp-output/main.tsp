
  import "@typespec/http";
  import "@typespec/openapi";
  import "@typespec/openapi3";

  using Http;
  using OpenAPI;

  
    @service({
      title: "OCTO API Specification"
    })
    @info({"version":"0.0.0"})
    
namespace OCTOAPISpecification;

  /**
* The defaultable ID is a string that can be used to identify a defaultable object.
* It is either a UUID in which case the object is uniquely identified (not defaulted) or
* it is the string `DEFAULT` in which case the object is defaulted.
* 
*/
scalar DefaultableID extends string;

@extension("x-go-type", "id.Capability")
@extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/id"})
enum Capability {
"octo/adjustments",
"octo/cart",
"octo/content",
"octo/mappings",
"octo/packages",
"octo/pickups",
"octo/pricing",
"octo/questions",
}

model Agent {
/**
* A unique ID / UUID generated to identify the agent.
*/@format("uuid") id: string;
/**
* Agent name.
*/ name: string;
/**
* Agent reference.
*/ reference: string | null;
/**
* An array of tags that can be used to filter.
*/ tags: (string)[];
}

model Reseller {
/**
* A unique ID / UUID generated to identify the reseller.
*/@format("uuid") id: string;
/**
* Reseller name.
*/ name: string;
/**
* Reseller reference.
*/ reference: string | null;
/**
* An array of tags that can be used to filter.
*/ tags: (string)[];
}

model Availability {
...AvailabilityPickups;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* The availability id, you''ll need this when booking. MUST be a unique identifier within the scope of an option.
*/@extension("x-order", 2) id: string;
/**
* The start time for this availability. This will be in the local time zone of the product. Must be an `ISO 8601` compliant date and time.
*/ localDateTimeStart: string;
/**
* The end time for this availability. This will be in the local time zone of the product. Must be an `ISO 8601` compliant date and time.
*/ localDateTimeEnd: string;
/**
* The time by which the booking must be confirmed at
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcCutoffAt: utcDateTime;
/**
* A boolean field indicating whether this is an all day availability and not a fixed departure time. If this value is true then there will be no other availability object on the same day.
*/ allDay: boolean;
/**
* Whether there is availability for this date / slot.
*/ available: boolean;
/**
* The status of that date. Possible values are:
* `AVAILABLE` This availability is available for sale
* `FREESALE` This availability has no capacity and is available.
* `SOLD_OUT` There are no more spots available for this date / slot.
* `LIMITED` This availability is available but has less than 50% capacity left.
* `CLOSED` Availability is closed for this day / slot.
*/ status: unknown;
/**
* This SHOULD NOT be returned when status is `FREESALE`. This SHOULD be a shared pool for all Unit types in the Option. If availability is tracked per-Unit then this value MUST be equal to the available quantity for the Unit that has the most remaining.
*/@extension("x-go-type", "float64") vacancies: integer | null;
/**
* The total capacity on this day.
*/@extension("x-go-type", "float64") capacity: integer | null;
/**
* The number of pax that can be booked on this availability.
*/@extension("x-go-type", "float64") paxCount: integer | null;
/**
* Maximum number of units that can be sold within one booking on this day / slot.
*/@extension("x-go-type", "float64") maxUnits: integer | null;
/**
* Maximum number of pax that can be sold within one booking on this day / slot.
*/@extension("x-go-type", "float64") maxPaxCount: integer | null;
/**
* A list of opening hours that the product is open on this day.
*/ openingHours: OpeningHours[];
/**
* Is on the object when Pricing capability is requested. 
*/ unitPricing?: PricingUnit[];
/**
* Is on the object when Pricing capability is requested. 
*/ pricing?: Pricing[];
}

model AvailabilityPickups {
/**
* Whether this availability has pickup available.
* This field is only present when the capability `octo/pickups` is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) pickupAvailable?: boolean;
/**
* Whether pickup is required for this availability.
* This field is only present when the capability `octo/pickups` is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) pickupRequired?: boolean;
/**
* A list of pickup points for this availability.
* This field is only present when the capability `octo/pickups` is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) pickupPoints?: PickupPoint[];
}

model AvailabilityCalendar {
/**
* A single date to query. Must be ISO 8601 compliant date.
*/ localDate: string;
/**
* Whether there is availability for this date / slot.
*/ available: boolean;
/**
* The status of that date. Possible values are:
* `AVAILABLE` This availability is available for sale
* `FREESALE` This availability has no capacity and is available.
* `SOLD_OUT` There are no more spots available for this date / slot.
* `LIMITED` This availability is available but has less than 50% capacity left.
* `CLOSED` Availability is closed for this day / slot.
*/ status: unknown;
/**
* This SHOULD NOT be returned when status is `FREESALE`. This SHOULD be a shared pool for all Unit types in the Option. If availability is tracked per-Unit then this value MUST be equal to the available quantity for the Unit that has the most remaining.
*/ vacancies: integer | null;
/**
* The total capacity on this day.
*/ capacity: integer | null;
/**
* A list of opening hours that the product is open on this day.
*/ openingHours: OpeningHours[];
/**
* Is on the object when Pricing capability is requested. 
*/ unitPricingFrom?: PricingUnit[];
/**
* Is on the object when Pricing capability is requested. 
*/ pricingFrom?: Pricing[];
}

model AvailabilityCalendarBody {
/**
* The product id.
*/ productId: string;
/**
* The option id.
*/ optionId: string;
/**
* Start date to query for (YYYY-MM-DD).
*/ localDateStart?: string;
/**
* End date to query for (YYYY-MM-DD).
*/ localDateEnd?: string;
/**
* A list of units.
*/ units?: AvailabilityUnit[];
/**
* Can be used only when pricing capability is used.
*/ currency?: string;
}

model AvailabilityCheckBody {
/**
* The product id.
*/ productId: string;
/**
* The option id.
*/ optionId: string;
/**
* Start date to query for (YYYY-MM-DD). Required if `localDateEnd` is set.
*/ localDateStart?: string;
/**
* End date to query for (YYYY-MM-DD). Required if `localDateStart` is set.
*/ localDateEnd?: string;
/**
* Filter the results by the given ids.
*/ availabilityIds?: (string)[];
/**
* A list of units.
*/ units?: AvailabilityUnit[];
/**
* Can be used only when pricing capability is used.
*/ currency?: string;
}

enum AvailabilityStatus {
"AVAILABLE",
"FREESALE",
"SOLD_OUT",
"LIMITED",
"CLOSED",
}

enum AvailabilityType {
"START_TIME",
"OPENING_HOURS",
}

/**
* A list of units.
*/
model AvailabilityUnit {
/**
* The unit id.
*/@extension("x-order", 1) id: string;
/**
* The quantity of the unit.
*/ quantity: integer;
}

model BaseError {
/**
* The error code. A table of possible error codes is shown below.
*/ error: string;
/**
* A human-readable error message will be translated depending on the language provided by the Accept-Language header.
*/ errorMessage: string;
}

model Booking {
...BookingAdjustments;
...BookingPackages;
...BookingPickups;
...BookingQuestions;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* A unique ID / UUID generated by the supplier system to identify the booking.
*/@extension("x-order", 2) @format("uuid") id: string;
/**
* A UUID you can set when generating the booking to use as an idempotency key.
*/@format("uuid") uuid: string;
/**
* A UUID you can set when generating the booking to use as an idempotency key.
*/@format("uuid") rebookingUuid?: string | null;
/**
* UUID of the original booking if this booking is a rebooking.
*/@format("uuid") originalRebookingUuid?: string | null;
/**
* An alias for the booking.
*/ `alias`?: string | null;
/**
* If `TRUE`, booking was created on test mode.
*/ testMode: boolean;
/**
* The reference set by the Reseller. A mandatory field for resellers to be set in the booking confirmation request.
*/ resellerReference: string | null;
/**
* The reference set by the Reseller. A mandatory field for resellers to be set in the booking confirmation request.
*/ supplierReference: string | null;
 settlementMethod: SettlementMethod;
/**
* If `TRUE`, booking was created as a quote.
*/ quote: boolean;
/**
* The product ID that identifies the product in the booking system to make this reservation.
*/@format("uuid") productId: string;
/**
* A bookable product listed by a supplier.
*/ product?: unknown;
/**
* The option ID that identifies the product option in the booking system to make this reservation.
*/ optionId: unknown;
/**
* The product ID that identifies the product option in the booking system to make this reservation.
*/ option?: unknown;
/**
* Whether the booking can be confirmed.
*/ confirmable: boolean;
/**
* Product options are subdivisions of the original product that will affect price and / or duration. Within the OCTo spec, every product must contain an option.
*/ cancellable: boolean;
/**
* A boolean field indicating whether this booking can be cancelled.
*/ cancellation: {} | null;
/**
* Whether the booking was made as freesale (without checking availability first).
*/ freesale: boolean;
/**
* The availability id that was used in the request.
*/ availabilityId: string | null;
/**
* The availability object that was booked.
* 
*/ availability: unknown | null;
/**
* Contact details for the guests that will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information)
*/ contact: unknown | null;
 agent: unknown | null;
 reseller: unknown | null;
/**
* An array of required contact fields.
*/ requiredContactFields: ContactField[];
/**
* An array of visible contact fields.
*/ visibleContactFields: ContactField[];
/**
* Optional notes for the booking.
*/ notes: string | null;
/**
* An array of delivery methods available for this booking.
*/ deliveryMethods: DeliveryMethod[];
/**
* A voucher for this booking.
*/ voucher: unknown;
/**
* An array o`f unit items that will be included in the booking.
*/@extension("x-go-type-skip-optional-pointer", true) unitItems: UnitItem[];
/**
* The status of the booking, possible values are:
* `ON_HOLD` The booking is pending confirmation, this is the default value when you first create the booking.
* `EXPIRED` If the booking is not confirmed before the expiration hold expires, it goes into an expired state.
* `CONFIRMED` Once the confirmation call is made the booking is ready to be used.
* `CANCELLED` If the booking is cancelled.
* `PENDING` If the booking is pending outside availability confirmation.
* `REDEEMED` If the booking is already redeemed.
*/ status: unknown;
/**
* Booking rejection.
*/ rejection?: unknown;
/**
* An RFC 3339 date times in UTC for when this booking is due to expire if the status is `ON_HOLD`.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcExpiresAt: utcDateTime | null;
@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types","type":"string","format":"date-time","nullable":true,"example":"2022-05-25 11:04:22Z","description":"An RFC 3339 date times in UTC for when this booking was marked as no-show."}) utcNoshowedAt?: unknown;
/**
* An RFC 3339 date time in UTC when the booking was rebooked.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcRebookedAt?: utcDateTime | null;
/**
* An RFC 3339 date time in UTC at when the booking was redeemed.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcRedeemedAt: utcDateTime | null;
/**
* An RFC 3339 date time in UTC when the booking was confirmed.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcConfirmedAt: utcDateTime | null;
/**
* An RFC 3339 date time in UTC when the booking was created.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcCreatedAt: utcDateTime;
/**
* An RFC 3339 date time in UTC when the booking was updated.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcUpdatedAt: utcDateTime;
}

model BookingCancellation {
/**
* Whether the booking was refunded as part of the cancellation. Possible values are `FULL`, `PARTIAL` or `NONE`
*/ refund: unknown;
/**
* A text value describing why the cancellation happened.
*/ reason: string | null;
/**
* An RFC 3339 date time in UTC indicating when the booking was cancelled.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcCancelledAt: utcDateTime;
}

model BookingCancellationBody {
/**
* A text value describing why the cancellation happened.
*/ reason?: string;
/**
* Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false)
*/ force?: boolean;
}

model BookingConfirmationBody {
/**
* Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false)
*/ emailReceipt?: boolean;
/**
* Your reference for this booking. Also known as a Voucher Number.
*/ resellerReference?: string;
/**
* Contact details for the main guest who will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).
*/ contact: unknown;
/**
* An array of unit items that will be included in the booking. This allows you to provide contact details or a reseller reference for each unit item. Be careful to make sure you include ALL unit items that you also had in the original booking reservation request, if you provide more or less than in the booking reservation call this will change the number of unit items being purchased also.
*/ unitItems?: UnitItemIdentifier[];
}

model BookingRejection {
/**
* A text value describing why the rejection happened.
*/ reason?: string;
/**
* An RFC 3339 date time in UTC indicating when the booking was rejected.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcRejectedAt?: utcDateTime;
}

model BookingAdjustments {
/**
* An array of adjustments that will be included in the booking.
* This field is only present when octo/adjustments capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/adjustments"}) adjustments?: BookingAdjustment[];
}

model BookingAdjustment {
 per: AdjustmentPer;
/**
* The amount of the adjustment.
*/@extension("x-go-type", "decimal.Decimal") @extension("x-go-type-import", {"path":"github.com/shopspring/decimal"}) amount: numeric;
/**
* Optional notes for the adjustment.
*/ notes?: string;
 netDiscount: AdjustmentDiscount;
}

/**
* The type of adjustment. Possible values are `BOOKING`, `UNIT` or `PERCENTAGE`
*/
enum AdjustmentPer {
"BOOKING",
"UNIT",
"PERCENTAGE",
}

/**
* The type of discount. Possible values are `NONE`, `FULL`, `SPLIT`, `PRORATED` or `MANUAL`
*/
enum AdjustmentDiscount {
"NONE",
"FULL",
"SPLIT",
"PRORATED",
"MANUAL",
}

model BookingPackages {
/**
* Whether the booking is a package.
* This field is only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) isPackage?: boolean;
/**
* The package ID that identifies the package in the booking system to make this reservation.
* This field is only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) @format("uuid") packageIncludeId?: string;
/**
* A package that will be included in the booking.
* This field is only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) packageInclude?: unknown;
/**
* An array of bookings that will be included in the package.
* This field is only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) packageBookings?: Booking[];
}

model BookingPickups {
/**
* Whether the booking requires a pickup. This field is only present when octo/pickups capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupRequested?: boolean;
/**
* The pickup ID that identifies the pickup in the booking system to make this reservation. This field is only present when octo/pickups capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) @format("uuid") pickupId?: string;
/**
* A hotel name and address that will be included in the booking.
* This field is only present when octo/pickups capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupHotel?: string;
/**
* A room number in the pickup hotel.
* This field is only present when octo/pickups capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupRoom?: string;
/**
* Optional notes for the pickup. This field is only present when octo/pickups capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupNotes?: string;
/**
* A pickup point that will be included in the booking. This field is only present when octo/pickups capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupPoint?: unknown;
}

model BookingQuestions {
/**
* An array of questions and andswers that will be included in the booking.
* This field is only present when octo/questions capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/questions"}) @extension("x-go-type-skip-optional-pointer", true) questionAnswers?: QuestionAnswer[];
}

model CustomerContact {
/**
* The tax ID of the booking holder or the ticket holder.
*/ taxId?: string | null;
/**
* The full name of the booking holder or the ticket holder. Can also be retrieved as an alias for the concatenation of `firstName` and `lastName`
*/ fullName?: string | null;
/**
* The first name of the booking holder or the ticket holder.
*/ firstName?: string | null;
/**
* The last name of the booking holder or the ticket holder.
*/ lastName?: string | null;
/**
* The email address of the booking holder or the ticket holder.
*/@format("email") emailAddress?: string | null;
/**
* The phone number of the booking holder or the ticket holder.
*/ phoneNumber?: string | null;
/**
* An array of locale values, equivalent to navigator.languages in a browsers environment.
*/ locales: (string)[] | null;
/**
* The street address of the booking holder or the ticket holder.
*/ streetAddress?: string | null;
/**
* The city of the booking holder or the ticket holder.
*/ city?: string | null;
/**
* The state of the booking holder or the ticket holder.
*/ state?: string | null;
/**
* The PO Box of the booking holder or the ticket holder.
*/ postalCode?: string | null;
/**
* The country of the booking holder or the ticket holder.
*/ country?: string | null;
/**
* Optional notes for the booking.
*/ notes?: string | null;
/**
* Whether the booking holder or the ticket holder allows marketing.
*/ allowMarketing: boolean;
}

enum BookingStatus {
  "ON_HOLD",
  "CONFIRMED",
  "EXPIRED",
"CANCELLED",
"REDEEMED",
"PENDING",
"REJECTED",
"NOSHOW",
"UPGRADED",
}

model UnitItemIdentifier {
/**
* The unit item unit ID.
*/@format("uuid") uuid?: string;
/**
* A unique UUID to identify the unit, same as the booking uuid except per unit.
*/ unitId: string;
/**
* Your reference for this booking. Also known as a Voucher Number.
*/ resellerReference?: string;
/**
* The alias of the unit item.
*/ `alias`?: string;
}

model CreateBookingBody {
/**
* Your reference for this booking. Also known as a Voucher Number.
*/ resellerReference?: string;
/**
* The product ID.
*/@format("uuid") productId: string;
/**
* The option ID.
*/@format("uuid") optionId: string;
/**
* The availability ID for the selected timeslot.
*/ availabilityId?: string;
/**
* A unique UUID to identify the booking. Setting this value acts like an idempotency key preventing you from double booking.
*/@format("uuid") uuid?: string;
/**
* The alias of the unit item.
*/ `alias`?: string;
 settlementMethod?: SettlementMethod;
/**
* How many minutes to reserve the availability, otherwise defaults to the supplier default amount.
*/@extension("x-go-type", "uint") expirationMinutes?: integer;
/**
* Optional notes for the booking.
*/ notes?: string;
/**
* Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false).
*/ emailReceipt?: boolean;
/**
* An array of unit items in the booking. To retain or modify existing unit items, you must include the unit item with the associated uuid, otherwise that unit item will be removed.
*/ unitItems: UnitItemIdentifier[];
/**
* Whether to quote the booking instead of confirming it.
*/ quote?: boolean;
/**
* Whether to set freesale mode.
*/ freesale?: boolean;
/**
* Whether the booking was redeemed.
*/ redeemed?: boolean;
/**
* Contact details for the main guest who will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).
*/ contact?: unknown;
}

model UpdateBookingBody {
/**
* Your reference for this booking. Also known as a Voucher Number.
*/ resellerReference?: string;
/**
* The product ID.
*/@format("uuid") productId?: string;
/**
* The option ID.
*/@format("uuid") optionId?: string;
/**
* The availability ID for the selected timeslot.
*/ availabilityId?: string;
/**
* A unique UUID to identify the booking. Setting this value acts like an idempotency key preventing you from double booking.
*/@format("uuid") uuid?: string;
/**
* The alias of the unit item.
*/ `alias`?: string;
 settlementMethod?: SettlementMethod;
/**
* How many minutes to reserve the availability, otherwise defaults to the supplier default amount.
*/@extension("x-go-type", "uint") expirationMinutes?: integer;
/**
* Optional notes for the booking.
*/ notes?: string;
/**
* Whether you want OCTO Cloud to email the guest a copy of their receipt and tickets. (defaults to false).
*/ emailReceipt?: boolean;
/**
* An array of unit items in the booking. To retain or modify existing unit items, you must include the unit item with the associated uuid, otherwise that unit item will be removed.
*/@extension("x-go-type-skip-optional-pointer", true) unitItems?: UnitItemIdentifier[];
/**
* Whether to quote the booking instead of confirming it.
*/ quote?: boolean;
/**
* Whether to set freesale mode.
*/ freesale?: boolean;
/**
* Whether the booking was redeemed.
*/ redeemed?: boolean;
/**
* Contact details for the main guest who will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information).
*/ contact?: unknown;
}

enum CancellationCutoffUnit {
"hour",
"minute",
"day",
}

enum ContactField {
"firstName",
"lastName",
"emailAddress",
"phoneNumber",
"country",
"notes",
"locales",
"allowMarketing",
"postalCode",
}

enum DeliveryFormat {
"PDF_URL",
"QRCODE",
"CODE128",
"PKPASS_URL",
}

enum DeliveryMethod {
"VOUCHER",
"TICKET",
}

model DeliveryOption {
/**
* The format for the delivery option possible values are:
* `QRCODE` You should generate the QR Code yourself on a ticket.
* `PDF_URL` Where you use the generated tickets as a PDF.
*/ deliveryFormat: unknown;
/**
* The format for the delivery option possible values are:
* `QRCODE` You should generate the QR Code yourself on a ticket.
* `PDF_URL` Where you use the generated tickets as a PDF.
* 
*/ deliveryValue: string;
}

enum DurationUnit {
"hour",
"minute",
"day",
}

model ErrorBadRequest {
...BaseError;
}

model ErrorForbidden {
...BaseError;
}

model ErrorInternalServerError {
...BaseError;
}

model ErrorInvalidAvailabilityID {
...BaseError;
/**
* Missing or invalid `availabilityId` in the request
*/ availabilityId: string;
}

model ErrorInvalidBookingUUID {
...BaseError;
/**
* Missing or invalid booking UUID, or if you're confirming the booking the booking may have expired already.
*/ uuid: string;
}

model ErrorInvalidOptionID {
...BaseError;
/**
* Missing or invalid `optionId` in the request
*/ optionId: string;
}

model ErrorInvalidProductID {
...BaseError;
/**
* Missing or invalid `productId` in the request
*/ productId: string;
}

model ErrorInvalidUnitID {
...BaseError;
/**
* Missing or invalid `unitId` in the request
*/ unitId: string;
}

model ErrorUnauthorized {
...BaseError;
}

model ErrorUnprocessableEntity {
...BaseError;
}

model ExtendReservationBody {
 expirationMinutes?: integer;
}

/**
* A list of opening hours that the product is open on this day.
*/
model OpeningHours {
/**
* When this product opens (HH:MM)
*/ from: string;
/**
* When this product closes (HH:MM)
*/ to: string;
}

model Option {
...OptionContent;
...OptionPackages;
...OptionPickups;
...OptionPricing;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* The id that identifies this option, it is only unique within the product.
*/@extension("x-order", 1) id: string;
/**
* `TRUE` identifies the option as default, and should therefore rendered and selected first
*/ default: boolean;
/**
* The name the supplier calls the option by.
*/ internalName: string;
/**
* An optional code this supplier might use to identify the product.
*/ reference: string | null;
/**
* An array of tags that can be used to filter products.
*/ tags: (string)[];
/**
* This will be an array of all possible start times that can be returned during availability. For example an all day attraction may have a single value like `["00:00"]` whilst a tour with multiple departure times may have multiple:`["09:00", "14:00", "17:00"]`.
*/@minItems(1) availabilityLocalStartTimes: (string)[];
/**
* This is how long before the tour the booking can be still be cancelled.
*/ cancellationCutoff: string;
/**
* The numeric amount for the cutoff.
*/ cancellationCutoffAmount: integer;
/**
* Time units used to determine duration. Three values are available: `hour`, `minute`, `day`.
*/ cancellationCutoffUnit: unknown;
/**
* An array of the contact fields required to confirm a booking. These just apply to the lead traveller on the booking and not for every ticket.
*/ requiredContactFields: ContactField[];
/**
* An array of the contact fields that are visible to the user when booking. These just apply to the lead traveller on the booking and not for every ticket.
*/ visibleContactFields: ContactField[];
 restrictions: OptionRestrictions;
/**
* The list of ticket types (units) available for sale
*/ units: Unit[];
}

model OptionContent {
/**
* The title of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) title?: string;
/**
* The subtitle of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) subtitle?: string;
/**
* The language of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) language: string;
/**
* The description of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) shortDescription?: string;
/**
* Human readable duration of the option. Duration starts to count on redemption.
* This field can be hidden by `hide_duration`.
* Only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) duration?: string;
/**
* The duration amount of the option.
* This field can be hidden by `hide_duration`.
* Only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type", "float64") durationAmount?: numeric;
/**
* The duration unit. Possible values are `hour`, `minute`, `day`.
* This field can be hidden by `hide_duration`.
* Only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) durationUnit?: unknown;
/**
* The cover image URL of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) coverImageUrl?: url | null;
/**
* The itinerary of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) itinerary?: unknown;
/**
* The origin point of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) fromPoint?: unknown;
/**
* The destination point of the option. Only present when octo/packages capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) toPoint?: unknown;
}

model OptionPackages {
/**
* Option package includes.
* Only present when octo/packages capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) @extension("x-go-type-skip-optional-pointer", true) packageIncludes?: PackageInclude[];
}

model OptionPickups {
/**
* Whether the option has pickup available.
* Only present when octo/pickups capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupAvailable: boolean;
/**
* Whether the option requires pickup.
* Only present when octo/pickups capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupRequired: boolean;
/**
* Pickup points for the option.
* Only present when octo/pickups capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pickups"}) pickupPoints: PickupPoint[];
}

model OptionPricing {
/**
* This is the price for the option as a whole. Only present if the octo/pricing capability is requested.
* Mutually exclusive with `pricingFrom`.
* It is calculated only when `pricingPer` is `BOOKING`.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pricing"}) pricing?: Pricing[];
/**
* This is in *indicative* price for the option as a whole. Only present if the octo/pricing capability is
* requested.
* Mutually exclusive with `pricing`.
* It is calculated only when `pricingPer` is `BOOKING`.
* 
*/ pricingFrom?: unknown;
}

model OptionRestrictions {
/**
* The minimum number of tickets that can be purchased in a single booking (null = 0).
*/ minUnits: integer | null;
/**
* The maximum number of tickets that can be purchased in a single booking (null = unlimited).
*/ maxUnits: integer | null;
/**
* The minimum number of pax units that can be purchased in a single booking (null = 0).
*/ minPaxCount: integer | null;
/**
* The maximum number of pax units that can be purchased in a single booking (null = unlimited).
*/ maxPaxCount: integer | null;
}

model OptionQuestions {
/**
* Questions for this option. Only present when octo/questions capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/questions"}) @extension("x-go-type-skip-optional-pointer", true) questions?: Question[];
}

/**
* Package include.
*/
model PackageInclude {
/**
* The product ID of the include. This is used internally for mapping.
*/@extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-go-type", "id.Product") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/id"}) @extension("x-go-name", "productID") @extension("x-oapi-codegen-only-honour-go-name", true) productId?: unknown;
/**
* Include group name or product name.
*/ title?: string;
/**
* Include count.
*/ count: integer;
/**
* An array of includes.
*/ includes: Include[];
}

model PickupPoint {
/**
* Unique identifier for the pickup point.
*/@format("uuid") id: string;
/**
* Name of the pickup point.
*/ name: string;
/**
* Optional directions to reach the pickup point.
*/ directions?: string | null;
/**
* Optional address of the pickup point.
*/ address?: string | null;
/**
* Latitude coordinate of the pickup point.
*/ latitude?: float32 | null;
/**
* Longitude coordinate of the pickup point.
*/ longitude?: float32 | null;
/**
* Local date and time of the pickup point.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) localDateTime?: utcDateTime | null;
/**
* Local date and time of the pickup point.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) localDateTimeTo?: utcDateTime | null;
/**
* Google Place ID associated with the pickup point.
*/ googlePlaceId?: string | null;
/**
* Street address of the pickup point.
*/ street?: string | null;
/**
* Postal code of the pickup point location.
*/ postalCode?: string | null;
/**
* Locality (city or town) of the pickup point.
*/ locality?: string | null;
/**
* Region (e.g., state or province) of the pickup point.
*/ region?: string | null;
/**
* State of the pickup point.
*/ state?: string | null;
/**
* Country of the pickup point.
*/ country?: string | null;
}

model Include {
/**
* The ID of the include.
*/@format("uuid") id: string;
/**
* Whether the include is required.
*/ required: boolean;
/**
* The limit of the include.
*/ limit: integer;
/**
* The validity days of the include.
*/ validityDays?: integer;
/**
* The product ID of the include.
*/@format("uuid") productId: string;
 product?: Product;
 optionId: DefaultableID;
 option?: Option;
}

/**
* The array of itinerary items.
*/
model Itinerary is ItineraryItem[];

model ItineraryItem {
/**
* The name of the itinerary.
*/ name: string;
/**
* The type of the itinerary.
* Possible values are `START`, `POI`, `END`, `EVENT`. The default is `START`.
* 
*/ type: "START" | "POI" | "END" | "EVENT";
/**
* The description of the itinerary.
*/ description?: string | null;
/**
* The address of the itinerary.
*/ address?: string;
/**
* The Google Place ID of the itinerary.
*/ googlePlaceId?: string;
/**
* The latitude of the itinerary.
*/ latitude?: numeric;
/**
* The longitude of the itinerary.
*/ longitude?: numeric;
/**
* The travel time of the itinerary.
*/ travelTime?: string | null;
/**
* The travel time amount of the itinerary.
*/@extension("x-go-type", "float64") travelTimeAmount?: numeric | null;
/**
* The travel time unit of the itinerary.
*/ travelTimeUnit?: unknown;
/**
* Human readable duration of the option. Duration starts to count on redemption.
* This field can be hidden by `hide_duration`.
* 
*/ duration?: string | null;
/**
* The duration amount of the option.
* This field can be hidden by `hide_duration`.
* 
*/@extension("x-go-type", "float64") durationAmount: numeric;
/**
* The duration unit. Possible values are `hour`, `minute`, `day`.
* This field can be hidden by `hide_duration`.
* 
*/ durationUnit: unknown;
}

model Point {
/**
* The ID of the point.
*/ id: string;
/**
* The internal name of the point.
*/ internalName?: string;
/**
* The title of the point.
*/ title?: string;
/**
* The short description of the point. This is preserved for historical compatibility, but will
* always be `nil`.
* 
*/ shortDescription?: string;
 pointGroup: PointGroup;
}

model PointGroup {
/**
* The ID of the point group.
*/ id: string;
/**
* The internal name of the point group.
*/ internalName: string;
/**
* The title of the point group.
*/ title: string;
/**
* The short description of the point group.
*/ shortDescription: string;
}

model Pricing {
/**
* The original price for this product which will be the same or higher than the sale amount. Use this to show a discount has been applied e.g. $10 $8.50
*/@extension("x-go-type", "int64") original: integer;
/**
* The sale price you should charge your customers.
*/@extension("x-go-type", "int64") retail: integer;
/**
* The wholesale rate the supplier will charge you for this sale.
*/@extension("x-go-type", "int64") net?: integer;
/**
* The currency.
*/ currency: string;
/**
* All pricing is given in integers to avoid floating point rounding issues. e.g. USD = 2 and JPY = 0. To convert a price to decimal you should do: price / (10 ** currencyPrecision) where ** is to the power of e.g. Math.pow(10, currencyPrecision).
*/ currencyPrecision: integer;
/**
* Any taxes included in the retail and/or net price.
*/ includedTaxes: Tax[];
}

/**
* Indicates whether the pricing is per unit (most common) or per booking.
* Pricing which is per booking is common for private charters or group booking products where the price is the same regardless of how many tickets are purchased.
* Possible values are `BOOKING` or `UNIT`.
* 
*/
enum PricingPer {
"BOOKING",
"UNIT",
}

model PricingUnit {
...Pricing;
/**
* ID of the unit this pricing is related to
*/ unitId: string;
}

model Product {
...ProductContent;
...ProductPackages;
...ProductPricing;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* The id used for checking for availability and creating bookings for the product. This MUST be unique within the scope of the Supplier.
*/@extension("x-order", 2) @format("uuid") id: string;
/**
* The name the supplier calls the product.
*/ internalName: string;
/**
* An optional code this supplier might use to identify the product.
*/ reference: string | null;
/**
* A language code indicating what language this product content is in. This MUST be a valid BCP 47 RFC 5646 RFC 4647 language tag.
*/ locale: string;
/**
* The IANA TimeZone name this product is located in.
*/ timeZone: string;
/**
* Whether a booking can be made for this product without having to query availability first.
*/ allowFreesale: boolean;
/**
* The amount of time in `freesaleDurationUnit` that a booking can be made without having to query availability first.
*/ freesaleDurationAmount: integer;
/**
* Time units used to determine duration. Three values are available: `hour`, `minute`, `day`.
*/ freesaleDurationUnit: unknown;
/**
* Whether bookings will be immediately confirmed when a sale is made, otherwise the supplier will later either accept or reject the booking. When instantConfirmation is set to false one should expect created bookings to first get into a PENDING state.
*/ instantConfirmation: boolean;
/**
* This indicates whether the Reseller can expect immediate delivery of the customer's tickets. If `false` then the Reseller MUST be able to delay delivery of the tickets to the customer.
*/ instantDelivery: boolean;
/**
* Whether an `availabilityId` is required when creating a booking. Without this the booking will be open-dated and not have a specified travel date.
*/ availabilityRequired: boolean;
/**
* What type of availability this product has, possible values are:
* `START_TIME` if there are fixed departure times which you must pick one. Typical for day tours or activities.
* `OPENING_HOURS` if you just select a date and can visit any time when the venue is open.
*/ availabilityType: unknown;
/**
* An array of formats the API will deliver the tickets as. Possible values are:
* `QRCODE` A code to be presented as a QR CODE barcode
* `CODE128A` code to be presented as a CODE 128 barcode
* `PDF_URL` A URL to a PDF file which contains all the ticket details
*/ deliveryFormats: DeliveryFormat[];
/**
* How the formats described in `deliveryFormats` will be delivered in the booking response, possible values are:
* `TICKET`: Individually per unit in the order (i.e. single ticket for each person)
* `VOUCHER`: One ticket for the whole booking
*/ deliveryMethods: DeliveryMethod[];
/**
* How the voucher can be redeemed. Possible values are:
* `MANIFEST` The guest name will be written down and they just need to show up
* `DIGITAL` The tickets/voucher must be scanned but can be on mobile
* `PRINT` The tickets/voucher must be printed and presented on arrival
*/ redemptionMethod: unknown;
/**
* An array of available settlement methods. Settlement methods are determined by the connection type.
* Possible values are:
* `DEFERRED`  Deferred payment. Only available if the deposits are allowed on the product level.
* `DEPOSIT`   TBD
* `DIRECT`    Used by checkout. Collect funds in cash or by card clear into the operations' account. commission.
* `VOUCHER`   TBD
* `WHOLESALE` TBD
*/ settlementMethods: SettlementMethod[];
/**
* An array of all options for this product. All products must have at least one option.
*/ options: Option[];
}

model ProductContent {
/**
* Country code for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) country?: string;
/**
* Location for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) location?: string;
/**
* Destination for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) destination?: unknown;
/**
* Alert message for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) alert?: string;
/**
* Title for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) title?: string;
/**
* Subtitle for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) subtitle?: string;
/**
* Description for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) description?: string;
/**
* Short description for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) shortDescription?: string;
/**
* Categories for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) categories?: Category[];
/**
* Inclusions for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) inclusions?: (string)[];
/**
* Exclusions for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) exclusions?: (string)[];
/**
* Highlights for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) highlights?: (string)[];
/**
* Whether this product is point to point or not. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) pointToPoint?: boolean;
/**
* Booking terms for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) bookingTerms?: string;
/**
* Privacy terms for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) privacyTerms?: string;
/**
* Redemption instructions for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) redemptionInstructions?: string;
/**
* Cancellation policy for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) cancellationPolicy?: string;
/** 
* FAQs for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) faqs?: FAQ[];
@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) coverImageUrl?: url;
@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) bannerImageUrl?: url;
@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) videoUrl?: url;
/**
* Gallery image URLs for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) galleryImages?: Image[];
/**
* Banner image URLs for this product. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) @extension("x-go-type-skip-optional-pointer", true) bannerImages?: Image[];
}

model ProductPricing {
/**
* Is on the object when Pricing capability is requested. Default currency for this product, if you omit the currency parameter on future endpoints this is the value the reservation system will fallback to.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pricing"}) defaultCurrency?: string;
/**
* Is on the object when Pricing capability is requested. Indicates whether the price includes tax or not.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pricing"}) @extension("x-go-type-skip-optional-pointer", true) taxIncluded?: boolean;
/**
* Is on the object when Pricing capability is requested. All the possible currencies that we accept for this product.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pricing"}) @extension("x-go-type-skip-optional-pointer", true) availableCurrencies?: (string)[];
/**
* Indicates whether the pricing is per unit (most common), or per booking. Pricing which is per
* booking is common for private charters or group booking products where the price is the same regardless of how many tickets are purchased.
* Available values are `BOOKING` or `UNIT`.
* Only present when octo/pricing capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pricing"}) pricingPer?: unknown;
}

model ProductPackages {
/**
* Is on the object when Pricing capability is requested. Indicates whether the product is a package or not.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) @extension("x-go-type-skip-optional-pointer", true) isPackage?: boolean;
/**
* Is on the object when Pricing capability is requested. Indicates whether the package booking requires availability to be checked.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/packages"}) @extension("x-go-type-skip-optional-pointer", true) packageBookingAvailabilityRequired?: boolean;
}

enum RedemptionMethod {
"DIGITAL",
"PRINT",
"MANIFEST",
}

enum Refund {
"FULL",
"PARTIAL",
"NONE",
}

model UnitRestrictions {
/**
* This is whether this unit is required to be chosen for purchase
*/ required: boolean;
/**
* This is the minumum age this unit can be sold to
*/ minAge: integer;
/**
* This is the maximum age this unit can be sold to
*/ maxAge: integer;
/**
* This is whether a form of identification will be required at redemption point (eg. student card)
*/ idRequired: boolean;
/**
* This is if there is a minimum amount of units to be chosen for purchase (eg. 2)
*/ minQuantity: integer | null;
/**
* This is if there is a maximum amount of units to be chosen for purchase (eg. 7)
*/ maxQuantity: integer | null;
/**
* This is the amount of people each unit counts as (eg. family == 4pax)
*/ paxCount: integer;
/**
* This is if the unit needs to be accompanied by another unit (eg. Infant with Adult)
*/ accompaniedBy: (string)[];
}

enum SettlementMethod {
"DEPOSIT",
"DEFERRED",
"DIRECT",
"VOUCHER",
"WHOLESALE",
}

model Supplier {
...SupplierContent;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* Unique identifier used in the platform to represent the supplier.
*/@extension("x-order", 2) @format("uuid") id: string;
/**
* Name the supplier uses to identify itsel. Usually what the end customer will know the supplier as.
*/ name: string;
/**
* This is the base URL that will be prepended to ALL other paths. The value SHOULD NOT contain a trailing /.
*/ endpoint: url;
 contact: SupplierContact;
}

/**
* Contact information.
*/
model SupplierContact {
/**
* This SHOULD be the website of the Supplier that is separate from the Booking Platform but MAY be a unique destination within the Booking Platform about the Supplier.
*/ website: string | null;
/**
* The email support contact for the Supplier.
*/@format("email") email: string | null;
/**
* The phone support contact for the Supplier.
*/ telephone: string | null;
/**
* The (snail) mail address support contact for the Supplier.
*/ address: string | null;
}

model SupplierContent {
/**
* The country the supplier is based in.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) country: string | null;
/**
* An array of destinations the supplier operates in.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) destinations: Destination[];
}

model Category {
/**
* Unique identifier used in the platform to represent the category.
*/@extension("x-order", 1) @format("uuid") id: string;
/**
* An array of product IDs that the category falls under.
* This field is not visible if this Category is a product category.
* 
*/ productIds?: (string)[];
/**
* The name of the category.
*/ name: string | null;
/**
* The title of the category.
*/ title: string | null;
/**
* `TRUE` identifies the category as default, and should therefore rendered and selected first
*/ default: boolean;
/**
* The description of the category.
*/ shortDescription: string | null;
/**
* The URL of the image that represents the category.
*/ bannerImageUrl: url | null;
/**
* The URL of the image that represents the category.
*/ coverImageUrl: url | null;
/**
* An array of tags that the category falls under.
*/ tags: (string)[];
}

/**
* Supplier destination information
*/
model Destination {
@extension("x-order", 1) id: unknown;
/**
* `TRUE identifies the destination as default, and should therefore rendered and selected first
*/ default: boolean;
/**
* The name of the destination.
*/ name: string | null;
/**
* The title of the destination.
*/ title: string | null;
/**
* The description of the destination.
*/ shortDescription?: string | null;
 contact: DestinationContact;
/**
* The country the destination is in.
*/ country?: string | null;
/**
* The latitude of the destination.
*/ latitude?: numeric | null;
/**
* The longitude of the destination.
*/ longitude?: numeric | null;
/**
* `TRUE` identifies the destination as featured, and should therefore rendered and selected first
*/ featured: boolean;
/**
* The Google Place ID for the destination.
*/ googlePlaceId?: string | null;
/**
* The URL of the image that represents the category.
*/ coverImageUrl?: url | null;
/**
* The URL of the image that represents the category.
*/ bannerImageUrl?: url | null;
/**
* The URL of the video that represents the category.
*/ videoUrl?: url | null;
/**
* The Facebook URL for the destination.
*/ facebookUrl?: url | null;
/**
* The Google URL for the destination.
*/ googleUrl?: url | null;
/**
* The Tripadvisor URL for the destination.
*/ tripadvisorUrl?: url | null;
/**
* The Twitter URL for the destination.
*/ twitterUrl?: url | null;
/**
* The YouTube URL for the destination.
*/ youtubeUrl?: url | null;
/**
* The Instagram URL for the destination.
*/ instagramUrl?: url | null;
/**
* An array of tags that the destination falls under.
*/ tags: (string)[];
/**
* An array of categories that the destination falls under.
*/@extension("x-go-type-skip-optional-pointer", true) categories?: Category[];
}

/**
* Contact information.
*/
model DestinationContact {
/**
* Contact name
*/ name: string | null;
/**
* This SHOULD be the website of the Supplier that is separate from the Booking Platform but MAY be a unique destination within the Booking Platform about the Supplier.
*/ website: string | null;
/**
* The email support contact for the Supplier.
*/ email: string | null;
/**
* The phone support contact for the Supplier.
*/ telephone: string | null;
/**
* The (snail) mail address support contact for the Supplier.
*/ address: string | null;
}

model FAQ {
/**
* The question of the FAQ.
*/ question: string;
/**
* The answer of the FAQ.
*/ answer: string;
}

model Image {
 url: url;
 title?: string | null;
 caption?: string | null;
}

model Tax {
 name: string;
@extension("x-go-type", "int64") retail: integer;
@extension("x-go-type", "int64") original: integer;
@extension("x-go-type", "int64") net?: unknown;
}

model Ticket {
/**
* How the voucher can be redeemed. Possible values are:
* `MANIFEST` The guest name will be written down and they just need to show up
* `DIGITAL` The tickets/voucher must be scanned but can be on mobile
* `PRINT` The tickets/voucher must be printed and presented on arrival
*/ redemptionMethod: unknown;
/**
* The time the ticket was redeemed in UTC.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcRedeemedAt?: utcDateTime | null;
/**
* The time the ticket was noshowed.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcNoshowedAt?: utcDateTime | null;
/**
* How the voucher can be redeemed. Possible values are:
* `MANIFEST` The guest name will be written down and they just need to show up
* `DIGITAL` The tickets/voucher must be scanned but can be on mobile
* `PRINT` The tickets/voucher must be printed and presented on arrival
*/ deliveryOptions: DeliveryOption[];
}

model Unit {
...UnitContent;
...UnitPricing;
...UnitQuestions;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* This MUST be a unique identifier within the scope of the option.
*/@extension("x-order", 2) id: string;
/**
* This should be a name to help with identifying the unit. It should NOT be shown to the customer.
*/ internalName: string;
/**
* This is an internal reference identifier that the Supplier wishes to use. It MAY be non-unique.
*/ reference: string | null;
/**
* This is the base unit type for this unit definition. A value of TRAVELLER MUST only be used in replacement of `ADULT`, `CHILD`, `INFANT`, `YOUTH`, `STUDENT`, or `SENIOR`.
*/ type: unknown;
/**
* unit restrictions
*/ restrictions: unknown;
/**
* This is the array of the contact information PER ticket that the supplier expects.
*/ requiredContactFields: ContactField[];
/**
* This is the array of the contact information PER ticket that the supplier expects.
*/ visibleContactFields: ContactField[];
/**
* This is an array of tags that can be used to filter the units.
*/ tags: (string)[];
}

model UnitContent {
/**
* Title for this unit. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) title: string;
/**
* Plural title for this unit. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) titlePlural: string;
/**
* Subtitle for this unit. Only present when octo/content capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/content"}) subtitle?: string;
}

model UnitPricing {
/**
* Pricing of this unit.
* This field is mutually exclusive with `pricingFrom` and is only present when
* the pricing is fixed for this unit by ticket or booking.
* Only present when octo/pricing capability is requested.
* 
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/pricing"}) pricing?: Pricing[];
/**
* *Indicative* Pricing of this unit. This field is mutually exclusive with `pricing`.
* We use `*From` suffix to indicate that this is not the final price.
* One object per currency in `availableCurrencies` for this unit.
* Only present when octo/pricing capability is requested.
* 
*/ pricingFrom?: unknown;
}

model UnitQuestions {
/**
* Questions for this unit. Only present when octo/questions capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/questions"}) @extension("x-go-type-skip-optional-pointer", true) questions?: Question[];
}

model UnitItem {
...UnitItemQuestions;
@extension("x-order", 1) @extension("x-go-name", "capabilities") @extension("x-internal", true) @extension("x-go-type-skip-optional-pointer", true) @extension("x-oapi-codegen-only-honour-go-name", true) capabilities?: Capability[];
/**
* The id of the unit, this will be unique to the option.
*/@extension("x-order", 2) @format("uuid") id?: string;
/**
* The octo uuid of the unit, this will be unique to the option.
*/@format("uuid") uuid: string | null;
/**
* An alias for the unit.
*/ `alias`?: string | null;
/**
* A reference the reseller uses to identify the unit within all bookings.
*/ resellerReference: string | null;
/**
* A reference the supplier uses to identify the unit within all bookings.
*/ supplierReference: string | null;
/**
* This MUST be a unique identifier within the scope of the option.
*/ unitId: string | null;
/**
* The id of the unit, this will be unique to the option.
*/@format("uuid") rebookingUuid?: string | null;
/**
* The id of the unit, this will be unique to the option.
*/@format("uuid") rebookingUnitItemUuid?: string | null;
/**
* The id of the unit, this will be unique to the option.
*/@format("uuid") originalRebookingUuid?: string | null;
/**
* The id of the unit, this will be unique to the option.
*/@format("uuid") originalRebookingUnitItemUuid?: string | null;
/**
* This is the base unit type for this unit definition. A value of TRAVELLER MUST only be used in replacement of `ADULT`, `CHILD`, `INFANT`, `YOUTH`, `STUDENT`, or `SENIOR`.
*/ unitType?: unknown;
 unit?: unknown;
/**
* The RFC 3339 date in UTC indicating when the ticket was rebooked.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcRebookedAt?: utcDateTime | null;
/**
* The RFC 3339 date in UTC indicating when the ticket was used at the attraction.
*/@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types"}) utcRedeemedAt: utcDateTime | null;
@extension("x-go-type", "types.TimeRFC3339") @extension("x-go-type-import", {"path":"ventrata-octo-api/pkg/types","type":"string","format":"date-time","example":"2021-10-27 23:28:43Z","description":"The time the ticket was noshowed."}) utcNoshowedAt?: unknown;
/**
* Contact details for the guests that will attend the tour/attraction. Contact Body can be applied to both the booking object (the main reservation) or the unit object (individual ticket holders - if the supplier requires this information)
*/ contact?: unknown;
 ticket: {};
/**
* The status of the booking, possible values are:
* `ON_HOLD` The booking is pending confirmation, this is the default value when you first create the booking.
* `EXPIRED` If the booking is not confirmed before the expiration hold expires, it goes into an expired state.
* `CONFIRMED` Once the confirmation call is made the booking is ready to be used.
* `CANCELLED` If the booking is cancelled.
* `PENDING` If the booking is pending outside availability confirmation.
* `REDEEMED` If the booking is already redeemed.
*/ status: unknown;
}

model UnitItemQuestions {
/**
* Questions for this unit item. Only present when octo/questions capability is requested.
*/@extension("x-oapi-codegen-extra-tags", {"capability":"octo/questions"}) @extension("x-go-type-skip-optional-pointer", true) questionAnswers?: QuestionAnswer[];
}

enum UnitType {
"ADULT",
"YOUTH",
"CHILD",
"INFANT",
"FAMILY",
"SENIOR",
"STUDENT",
"MILITARY",
"OTHER",
}

model Question {
/**
* Unique identifier used in the platform to represent the question.
*/@extension("x-order", 1) @format("uuid") id: string;
/**
* The question that should be asked to the customer.
*/ label?: string | null;
/**
* A hint to help the customer answer the question.
*/ hint?: string | null;
/**
* The maximum length of the answer to the question.
*/ maxLength?: integer | null;
/**
* The type of input that should be used to answer the question. Possible values are `radio`, `select`, `textarea`.
*/ inputType: "radio" | "select" | "textarea";
/**
* `TRUE` identifies the question as required, and should therefore be answered by the customer
*/ required: boolean;
/**
* The options that the customer can select from. Only present when `inputType` is `radio` or `select`.
*/ selectOptions: SelectOption[];
}

model QuestionAnswer {
...Question;
/**
* Unique identifier used in the platform to represent the question.
*/@format("uuid") questionId: string;
/**
* The answer to the question.
*/ value?: string;
}

union Voucher {
null,
}

model SelectOption {
/**
* The label that will be shown to the customer.
*/ label: string;
/**
* The value that will be sent to the supplier.
*/ value: string;
}

/**
* The request has succeeded.
*/
model Availabilities_AvailabilityCheck200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Availability[];
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Availabilities_AvailabilityCheck400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidProductID | ErrorInvalidOptionID | ErrorBadRequest | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Availabilities_AvailabilityCalendar200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: AvailabilityCalendar[];
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Availabilities_AvailabilityCalendar400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidProductID | ErrorInvalidOptionID | ErrorBadRequest | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_GetBookings200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking[];
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_GetBookings400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_CreateBooking200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_CreateBooking400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidProductID | ErrorInvalidOptionID | ErrorInvalidUnitID | ErrorInvalidAvailabilityID | ErrorUnprocessableEntity | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_GetBooking200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_GetBooking400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidBookingUUID | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_UpdateBooking200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_UpdateBooking400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidProductID | ErrorInvalidOptionID | ErrorInvalidUnitID | ErrorInvalidAvailabilityID | ErrorInvalidBookingUUID | ErrorUnprocessableEntity | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_CancelBooking200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_CancelBooking400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidBookingUUID | ErrorUnprocessableEntity | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_ConfirmBooking200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_ConfirmBooking400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidProductID | ErrorInvalidOptionID | ErrorInvalidUnitID | ErrorInvalidAvailabilityID | ErrorInvalidBookingUUID | ErrorUnprocessableEntity | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Bookings_ExtendReservation200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Booking;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Bookings_ExtendReservation400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidBookingUUID | ErrorUnprocessableEntity | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Products_GetProducts200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Product[];
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Products_GetProducts400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Products_GetProduct200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Product;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Products_GetProduct400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorInvalidProductID | ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

/**
* The request has succeeded.
*/
model Suppliers_get200ApplicationJsonResponse {
@statusCode statusCode: 200;
@bodyRoot body: Supplier;
}

/**
* The server could not understand the request due to invalid syntax.
*/
@error
model Suppliers_get400ApplicationJsonResponse {
@statusCode statusCode: 400;
@bodyRoot body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

  /**
* This endpoint is slightly slower as it will return an object for each individual departure time (or day). You have to perform this step to retrieve an `availabilityId` in order to confirm a sale, so if you just want to use this endpoint and skip the calendar endpoint then that's perfectly ok.
* 
* You must pass in one of the following combinations of parameters for this endpoint:
* - `localDate`
* - `localeDateStart` and `localDateEnd`
* - `availabilityIds`
*/ @tag("Availability") @route("/availability/") @post @summary("Availability Check") op Availabilities_AvailabilityCheck(@bodyRoot body: AvailabilityCheckBody): Availabilities_AvailabilityCheck200ApplicationJsonResponse | Availabilities_AvailabilityCheck400ApplicationJsonResponse;

/**
* This endpoint is highly optimised and will return a single object per day. It's designed to be queried for large date ranges and the result is used to populate an availability calendar.
* 
* When the end user selects an open date you can call on `/availability` endpoint to get the `availabilityId` to create the booking
*/ @tag("Availability") @route("/availability/calendar") @post @summary("Availability Calendar") op Availabilities_AvailabilityCalendar(@bodyRoot body: AvailabilityCalendarBody): Availabilities_AvailabilityCalendar200ApplicationJsonResponse | Availabilities_AvailabilityCalendar400ApplicationJsonResponse;

/**
* This endpoint will fetch the bookings you have made for the given filters.
* 
* When using this endpoint you must include one of the following query parameters:
* 
* - `resellerReference`
* - `supplierReference`
* - `localDate`
* - `localDateStart` and `localDateEnd`
*/ @tag("Bookings") @route("/bookings/") @get @summary("Get Bookings") op Bookings_GetBookings(/**
* The reseller reference on the booking
*/ @query resellerReference?: string, /**
* The reference provided by the supplier
*/ @query supplierReference?: string, /**
* All bookings made for a specific date
*/ @query localDate?: string, /**
* First date of a date range search
*/ @query localDateStart?: string, /**
* Last date of a date range search
*/ @query localDateEnd?: string, /**
* The product id to filter by
*/ @query productId?: string, /**
* The option id to filter by
*/ @query optionId?: string)
: Bookings_GetBookings200ApplicationJsonResponse | Bookings_GetBookings400ApplicationJsonResponse;

/**
* Reserving availability when making a booking. The steps to make a reservation are:
* 
* 1. **Check Availability**: Check the availability on the [/availability](docs/octo/branches/main/5b08f5f75e75d-availability-check) endpoint to retrieve an `availabilityId`
* 2. **Booking Reservation** (this step): Create a booking that reserves the availability while you collect payment and contact information from the customer. The booking will remain with status `ON_HOLD` until the booking is confirmed or the reservation hold expires.
* 
* The availability for the booking is held for the amount of time equal to the`expirationMinutes` parameter (if provided), up to an internal limit set by either the supplier or the OCTo provider. The `utc_expires_at` parameter in the response object will indicate when a reservtion will expire. A reservation can be extended by calling the [/bookings/{uuid}/extend](docs/octo/branches/main/2c7924ab9128f-extend-reservation) endpoint.
* 
* A reserved booking can be confirmed after the customer finalizes their choice on the [/bookings/{uuid}/confirm](docs/octo/branches/main/614d1613b2d70-booking-confirmation) endpoint provided the reservation had not expired.
* 
*/ @tag("Bookings") @route("/bookings/") @post @summary("Booking Reservation") op Bookings_CreateBooking(@bodyRoot body: CreateBookingBody): Bookings_CreateBooking200ApplicationJsonResponse | Bookings_CreateBooking400ApplicationJsonResponse;

/**
* Fetch the status of an existing booking.
*/ @tag("Bookings") @route("/bookings/{bookingId}") @get @summary("Get Booking") op Bookings_GetBooking(/**
* The UUID of the booking
*/ @path bookingId: string, /**
* Include the product in the response
*/ @query(#{explode: true}) includeProduct?: boolean, /**
* Include the option in the response
*/ @query(#{explode: true}) includeOption?: boolean): Bookings_GetBooking200ApplicationJsonResponse | Bookings_GetBooking400ApplicationJsonResponse;

/**
* Updates a booking before and after it has been confirmed as long as it hasn''t been redeemed or within the cancellation cutoff window. To know if the booking can be updated check the booking''s `cancellable` field. If the booking can be cancelled, it can also be updated. It''s generally preferred to update a booking rather than cancelling it and rebooking
*/ @tag("Bookings") @route("/bookings/{bookingId}") @patch @summary("Booking Update") op Bookings_UpdateBooking(/**
* The UUID of the booking
*/ @path bookingId: string, /**
* Include the product in the response
*/ @query(#{explode: true}) includeProduct?: boolean, /**
* Include the option in the response
*/ @query(#{explode: true}) includeOption?: boolean, @bodyRoot body: UpdateBookingBody): Bookings_UpdateBooking200ApplicationJsonResponse | Bookings_UpdateBooking400ApplicationJsonResponse;

/**
* For cancelling bookings. You can only cancel a booking if `booking.cancellable` is `TRUE`, and is within the booking cancellation cut-off window.
*/ @tag("Bookings") @route("/bookings/{bookingId}/cancel") @post @summary("Booking Cancellation") op Bookings_CancelBooking(/**
* The UUID of the booking
*/ @path bookingId: string, @bodyRoot body: BookingCancellationBody): Bookings_CancelBooking200ApplicationJsonResponse | Bookings_CancelBooking400ApplicationJsonResponse;

/**
* This endpoint confirms the booking so it's ready to be used.
*/ @tag("Bookings") @route("/bookings/{bookingId}/confirm") @post @summary("Booking Confirmation") op Bookings_ConfirmBooking(/**
* The UUID of the booking
*/ @path bookingId: string, @bodyRoot body: BookingConfirmationBody): Bookings_ConfirmBooking200ApplicationJsonResponse | Bookings_ConfirmBooking400ApplicationJsonResponse;

/**
* Use this endpoint to hold the availability for a booking longer if the status is `ON_HOLD`.
*/ @tag("Bookings") @route("/bookings/{bookingId}/extend") @post @summary("Extend Reservation") op Bookings_ExtendReservation(/**
* The UUID of the booking
*/ @path bookingId: string, @bodyRoot body: ExtendReservationBody): Bookings_ExtendReservation200ApplicationJsonResponse | Bookings_ExtendReservation400ApplicationJsonResponse;

/**
* Fetch the list of products.
*/ @tag("Products") @route("/products/") @get @summary("Get Products") op Products_GetProducts(): Products_GetProducts200ApplicationJsonResponse | Products_GetProducts400ApplicationJsonResponse;

/**
* Fetch the product for the given id.
*/ @tag("Products") @route("/products/{id}") @get @summary("Get Product") op Products_GetProduct(/**
* The product id
*/ @path id: string): Products_GetProduct200ApplicationJsonResponse | Products_GetProduct400ApplicationJsonResponse;

/**
* Returns the supplier and associated contact details.
*/ @tag("Supplier") @route("/supplier/") @get @summary("Get Supplier") op Suppliers_get(): Suppliers_get200ApplicationJsonResponse | Suppliers_get400ApplicationJsonResponse;

  
  