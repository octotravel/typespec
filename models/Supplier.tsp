const SUPPLIER_ID_DOC = "Unique identifier used in the platform to represent the supplier.";
const SUPPLIER_NAME_DOC = "Name the supplier uses to identify itsel. Usually what the end customer will know the supplier as.";
const SUPPLIER_ENDPOINT_DOC = "This is the base URL that will be prepended to ALL other paths. The value SHOULD NOT contain a trailing /.";
const SUPPLIER_CONTACT_DOC = "";

const SUPPLIER_ID_EXAMPLE = "697e3ce8-1860-4cbf-80ad-95857df1f640";
const SUPPLIER_NAME_EXAMPLE = "Edin Explore";
const SUPPLIER_ENDPOINT_EXAMPLE = "https://api.ventrata.com/api-octo";

const SUPPLIER_CONTACT_WEBSITE_DOC = "This SHOULD be the website of the Supplier that is separate from the Booking Platform but MAY be a unique destination within the Booking Platform about the Supplier.";
const SUPPLIER_CONTACT_EMAIL_DOC = "The email support contact for the Supplier.";
const SUPPLIER_CONTACT_TELEPHONE_DOC = "The phone support contact for the Supplier.";
const SUPPLIER_CONTACT_ADDRESS_DOC = "The (snail) mail address support contact for the Supplier.";

const SUPPLIER_CONTACT_WEBSITE_EXAMPLE = null;
const SUPPLIER_CONTACT_EMAIL_EXAMPLE = "support@ventrata.com";
const SUPPLIER_CONTACT_TELEPHONE_EXAMPLE = null;
const SUPPLIER_CONTACT_ADDRESS_EXAMPLE = "Marble Arch, London, W1H 7EJ, United Kingdom";

const SUPPLIER_CONTACT_EXAMPLE = #{
  website: SUPPLIER_CONTACT_WEBSITE_EXAMPLE,
  email: SUPPLIER_CONTACT_EMAIL_EXAMPLE,
  telephone: SUPPLIER_CONTACT_TELEPHONE_EXAMPLE,
  address: SUPPLIER_CONTACT_ADDRESS_EXAMPLE,
};

const SUPPLIER_EXAMPLE = #{
  id: SUPPLIER_ID_EXAMPLE,
  name: SUPPLIER_NAME_EXAMPLE,
  endpoint: SUPPLIER_ENDPOINT_EXAMPLE,
  contact: SUPPLIER_CONTACT_EXAMPLE,
};

@example(SUPPLIER_EXAMPLE)
model Supplier {
  @doc(SUPPLIER_ID_DOC)
  @example(SUPPLIER_ID_EXAMPLE)
  id: string;

  @doc(SUPPLIER_NAME_DOC)
  @example(SUPPLIER_NAME_EXAMPLE)
  name: string;

  @doc(SUPPLIER_ENDPOINT_DOC)
  @example(SUPPLIER_ENDPOINT_EXAMPLE)
  @format("uri")
  endpoint: string;

  @doc(SUPPLIER_CONTACT_DOC)
  @example(SUPPLIER_CONTACT_EXAMPLE)
  contact: SupplierContact;
}

@example(SUPPLIER_CONTACT_EXAMPLE)
model SupplierContact {
  @doc(SUPPLIER_CONTACT_WEBSITE_DOC)
  @example(null)
  website: string | null;

  @doc(SUPPLIER_CONTACT_EMAIL_DOC)
  @example(SUPPLIER_CONTACT_EMAIL_EXAMPLE)
  email: string | null;

  @doc(SUPPLIER_CONTACT_TELEPHONE_DOC)
  @example(SUPPLIER_CONTACT_TELEPHONE_EXAMPLE)
  telephone: string | null;

  @doc(SUPPLIER_CONTACT_ADDRESS_DOC)
  @example(SUPPLIER_CONTACT_ADDRESS_EXAMPLE)
  address: string | null;
}
