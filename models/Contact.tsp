const CONTACT_FULL_NAME_DOC = "The full name of the booking holder. Can also be retrieved as an alias for the concatenation of firstName and lastName";
const CONTACT_FIRST_NAME_DOC = "The first name of the booking holder.";
const CONTACT_LAST_NAME_DOC = "The last name of the booking holder.";
const CONTACT_EMAIL_ADDRESS_DOC = "The email address of the booking holder.";
const CONTACT_PHONE_NUMBER_DOC = "The phone number of the booking holder.";
const CONTACT_LOCALES_DOC = "An array of locale values, equivalent to navigator.languages in a browsers environment; representing customer language for booking communications.";
const CONTACT_POSTAL_CODE_DOC = "The PO Box of the booking holder or the ticket holder.";
const CONTACT_COUNTRY_DOC = "The country of the booking holder or the ticket holder.";
const CONTACT_NOTES_DOC = "Customer-facing public notes for the booking.";

const CONTACT_FULL_NAME_EXAMPLE = "John Doe";
const CONTACT_FIRST_NAME_EXAMPLE = "John";
const CONTACT_LAST_NAME_EXAMPLE = "Doe";
const CONTACT_EMAIL_ADDRESS_EXAMPLE = "johndoe@email.com";
const CONTACT_PHONE_NUMBER_EXAMPLE = "";
const CONTACT_LOCALES_EXAMPLE = #["en"];
const CONTACT_POSTAL_CODE_EXAMPLE = "";
const CONTACT_COUNTRY_EXAMPLE = "";
const CONTACT_NOTES_EXAMPLE = "";

const CONTACT_EXAMPLE = #{
  fullName: CONTACT_FULL_NAME_EXAMPLE,
  firstName: CONTACT_FIRST_NAME_EXAMPLE,
  lastName: CONTACT_LAST_NAME_EXAMPLE,
  emailAddress: CONTACT_EMAIL_ADDRESS_EXAMPLE,
  phoneNumber: CONTACT_PHONE_NUMBER_EXAMPLE,
  locales: CONTACT_LOCALES_EXAMPLE,
  postalCode: CONTACT_POSTAL_CODE_EXAMPLE,
  country: CONTACT_COUNTRY_EXAMPLE,
  notes: CONTACT_NOTES_EXAMPLE,
};

@example(CONTACT_EXAMPLE)
model Contact {
  @doc(CONTACT_FULL_NAME_DOC)
  @example(CONTACT_FULL_NAME_EXAMPLE)
  fullName: string | null;

  @doc(CONTACT_FIRST_NAME_DOC)
  @example(CONTACT_FIRST_NAME_EXAMPLE)
  firstName: string | null;

  @doc(CONTACT_LAST_NAME_DOC)
  @example(CONTACT_LAST_NAME_EXAMPLE)
  lastName: string | null;

  @doc(CONTACT_EMAIL_ADDRESS_DOC)
  @example(CONTACT_EMAIL_ADDRESS_EXAMPLE)
  @format("email")
  emailAddress: string | null;

  @doc(CONTACT_PHONE_NUMBER_DOC)
  @example(CONTACT_PHONE_NUMBER_EXAMPLE)
  phoneNumber: string | null;

  @doc(CONTACT_LOCALES_DOC)
  @example(CONTACT_LOCALES_EXAMPLE)
  locales: string[];

  @doc(CONTACT_POSTAL_CODE_DOC)
  @example(CONTACT_POSTAL_CODE_EXAMPLE)
  postalCode: string | null;

  @doc(CONTACT_COUNTRY_DOC)
  @example(CONTACT_COUNTRY_EXAMPLE)
  country: string | null;

  @doc(CONTACT_NOTES_DOC)
  @example(CONTACT_NOTES_EXAMPLE)
  notes: string | null;
}
