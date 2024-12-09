import "@typespec/openapi3";

import "./capabilities/Capability.tsp";
import "./capabilities/content/SupplierContent.tsp";
import "./SupplierContact.tsp";

const SUPPLIER_ID_DOC = "Unique identifier for the supplier, used across the platform to represent this supplier entity. This identifier must be unique within the supplier system.";
const SUPPLIER_NAME_DOC = "Name used to identify the supplier within the platform. This name is typically recognized by end customers as the official name of the supplier's business entity. It should clearly represent the supplier's brand or identity to ensure consistency across platforms. For larger multi-venue suppliers, this represents the parent entity's name. Other associated entities or sub-divisions can be specified using the octo/content capability through the venues field.";
const SUPPLIER_ENDPOINT_DOC = "The base URL that is prepended to all other API paths. The value should not contain a trailing slash and must follow URI format.";
const SUPPLIER_CONTACT_DOC = "A structured object containing defined contact fields related to the supplier. This includes various communication methods (e.g., website, email, phone) and address information. It ensures standardized contact details that facilitate seamless communication with the supplier for both customers and partners.";
const SUPPLIER_CAPABILITIES_DOC = "An array of capabilities that the supplier has. Possible values are:`octo/content` The supplier can provide pricing information";

const SUPPLIER_ID_EXAMPLE = "697e3ce8-1860-4cbf-80ad-95857df1f640";
const SUPPLIER_NAME_EXAMPLE = "Merlin Entertainments";
const SUPPLIER_ENDPOINT_EXAMPLE = "https://api.my-booking-platform.com/v1";
const SUPPLIER_CAPABILITIES_EXAMPLE = #[Capability.CONTENT];

const SUPPLIER_EXAMPLE = #{
  id: SUPPLIER_ID_EXAMPLE,
  name: SUPPLIER_NAME_EXAMPLE,
  endpoint: SUPPLIER_ENDPOINT_EXAMPLE,
  contact: SUPPLIER_CONTACT_EXAMPLE,
  capabilities: SUPPLIER_CAPABILITIES_EXAMPLE,
};

@example(SUPPLIER_EXAMPLE)
@TypeSpec.OpenAPI.extension("x-supported-capabilities", [Capability.CONTENT])
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

  @doc(SUPPLIER_CAPABILITIES_DOC)
  @example(SUPPLIER_CAPABILITIES_EXAMPLE)
  @TypeSpec.OpenAPI.extension("x-go-name", "capabilities")
  @TypeSpec.OpenAPI.extension("x-go-json-ignore", true)
  @TypeSpec.OpenAPI.extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities: Capability[];

  ...SupplierContent;
}
