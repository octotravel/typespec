namespace Octo;

const BOOKING_CONTACT_BODY_FULL_NAME_DOC = "The full name of the booking holder or the ticket holder. Can also be retrieved as an alias for the concatenation of `firstName` and `lastName`";
const BOOKING_CONTACT_BODY_FIRST_NAME_DOC = "The first name of the booking holder or the ticket holder.";
const BOOKING_CONTACT_BODY_LAST_NAME_DOC = "The last name of the booking holder or the ticket holder.";
const BOOKING_CONTACT_BODY_EMAIL_ADDRESS_DOC = "The email address of the booking holder or the ticket holder.";
const BOOKING_CONTACT_BODY_PHONE_NUMBER_DOC = "The phone number of the booking holder or the ticket holder.";
const BOOKING_CONTACT_BODY_LOCALES_DOC = "An array of locale values, equivalent to navigator.languages in a browsers environment.";
const BOOKING_CONTACT_BODY_POSTAL_CODE_DOC = "The PO Box of the booking holder or the ticket holder.";
const BOOKING_CONTACT_BODY_COUNTRY_DOC = "The country of the booking holder or the ticket holder.";
const BOOKING_CONTACT_BODY_NOTES_DOC = "Optional notes for the booking.";

const BOOKING_CONTACT_BODY_FULL_NAME_EXAMPLE = "John Doe";
const BOOKING_CONTACT_BODY_FIRST_NAME_EXAMPLE = "John";
const BOOKING_CONTACT_BODY_LAST_NAME_EXAMPLE = "Doe";
const BOOKING_CONTACT_BODY_EMAIL_ADDRESS_EXAMPLE = "johndoe@email.com";
const BOOKING_CONTACT_BODY_PHONE_NUMBER_EXAMPLE = "+447840739436";
const BOOKING_CONTACT_BODY_LOCALES_EXAMPLE = #["en", "en-GB", "en-US"];
const BOOKING_CONTACT_BODY_POSTAL_CODE_EXAMPLE = "";
const BOOKING_CONTACT_BODY_COUNTRY_EXAMPLE = "GB";
const BOOKING_CONTACT_BODY_NOTES_EXAMPLE = "Optional notes";

const BOOKING_CONTACT_BODY_EXAMPLE = #{
  fullName: BOOKING_CONTACT_BODY_FULL_NAME_EXAMPLE,
  firstName: BOOKING_CONTACT_BODY_FIRST_NAME_EXAMPLE,
  lastName: BOOKING_CONTACT_BODY_LAST_NAME_EXAMPLE,
  emailAddress: BOOKING_CONTACT_BODY_EMAIL_ADDRESS_EXAMPLE,
  phoneNumber: BOOKING_CONTACT_BODY_PHONE_NUMBER_EXAMPLE,
  locales: BOOKING_CONTACT_BODY_LOCALES_EXAMPLE,
  country: BOOKING_CONTACT_BODY_COUNTRY_EXAMPLE,
};

@example(BOOKING_CONTACT_BODY_EXAMPLE)
model BookingContact {
  @doc(BOOKING_CONTACT_BODY_FULL_NAME_DOC)
  @example(BOOKING_CONTACT_BODY_FULL_NAME_EXAMPLE)
  fullName?: string;

  @doc(BOOKING_CONTACT_BODY_FIRST_NAME_DOC)
  @example(BOOKING_CONTACT_BODY_FIRST_NAME_EXAMPLE)
  firstName?: string;

  @doc(BOOKING_CONTACT_BODY_LAST_NAME_DOC)
  @example(BOOKING_CONTACT_BODY_LAST_NAME_EXAMPLE)
  lastName?: string;

  @doc(BOOKING_CONTACT_BODY_EMAIL_ADDRESS_DOC)
  @example(BOOKING_CONTACT_BODY_EMAIL_ADDRESS_EXAMPLE)
  @format("email")
  emailAddress?: string;

  @doc(BOOKING_CONTACT_BODY_PHONE_NUMBER_DOC)
  @example(BOOKING_CONTACT_BODY_PHONE_NUMBER_EXAMPLE)
  phoneNumber?: string;

  @doc(BOOKING_CONTACT_BODY_LOCALES_DOC)
  @example(BOOKING_CONTACT_BODY_LOCALES_EXAMPLE)
  locales?: string[];

  @doc(BOOKING_CONTACT_BODY_POSTAL_CODE_DOC)
  @example(BOOKING_CONTACT_BODY_POSTAL_CODE_EXAMPLE)
  postalCode?: string;

  @doc(BOOKING_CONTACT_BODY_COUNTRY_DOC)
  @example(BOOKING_CONTACT_BODY_COUNTRY_EXAMPLE)
  country?: string;

  @doc(BOOKING_CONTACT_BODY_NOTES_DOC)
  @example(BOOKING_CONTACT_BODY_NOTES_EXAMPLE)
  notes?: string;
}
