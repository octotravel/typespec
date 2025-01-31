namespace Ventrata;

const DESTINATION_CONTACT_NAME_DOC = "Contact name";
const DESTINATION_CONTACT_EMAIL_DOC = "The email support contact for the Supplier.";
const DESTINATION_CONTACT_TELEPHONE_DOC = "The phone support contact for the Supplier.";
const DESTINATION_CONTACT_ADDRESS_DOC = "The (snail) mail address support contact for the Supplier.";
const DESTINATION_CONTACT_WEBSITE_DOC = "This SHOULD be the website of the Supplier that is separate from the Booking Platform but MAY be a unique destination within the Booking Platform about the Supplier.";

const DESTINATION_CONTACT_NAME_EXAMPLE = null;
const DESTINATION_CONTACT_EMAIL_EXAMPLE = "support@ventrata.com";
const DESTINATION_CONTACT_TELEPHONE_EXAMPLE = null;
const DESTINATION_CONTACT_ADDRESS_EXAMPLE = "Marble Arch, London, W1H 7EJ, United Kingdom";
const DESTINATION_CONTACT_WEBSITE_EXAMPLE = null;

const DESTINATION_CONTACT_EXAMPLE = #{
  name: DESTINATION_CONTACT_NAME_EXAMPLE,
  email: DESTINATION_CONTACT_EMAIL_EXAMPLE,
  telephone: DESTINATION_CONTACT_TELEPHONE_EXAMPLE,
  address: DESTINATION_CONTACT_ADDRESS_EXAMPLE,
  website: DESTINATION_CONTACT_WEBSITE_EXAMPLE,
};

@doc("Contact information.")
@example(DESTINATION_CONTACT_EXAMPLE)
model DestinationContact {
  @doc(DESTINATION_CONTACT_NAME_DOC)
  @example(DESTINATION_CONTACT_NAME_EXAMPLE)
  name: string | null;

  @doc(DESTINATION_CONTACT_EMAIL_DOC)
  @example(DESTINATION_CONTACT_EMAIL_EXAMPLE)
  email: string | null;

  @doc(DESTINATION_CONTACT_TELEPHONE_DOC)
  @example(DESTINATION_CONTACT_TELEPHONE_EXAMPLE)
  telephone: string | null;

  @doc(DESTINATION_CONTACT_ADDRESS_DOC)
  @example(DESTINATION_CONTACT_ADDRESS_EXAMPLE)
  @format("email")
  address: string | null;

  @doc(DESTINATION_CONTACT_WEBSITE_DOC)
  @example(DESTINATION_CONTACT_WEBSITE_EXAMPLE)
  website: string | null;
}
