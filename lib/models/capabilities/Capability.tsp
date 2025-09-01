import "@typespec/openapi";
import "./CapabilityId.tsp";

// --- Documentation ---
const CAPABILITY_ID_DOC = "Unique identifier of the capability.";
const CAPABILITY_REVISION_DOC = "Revision number for the capability.";
const CAPABILITY_REQUIRED_DOC = "Whether this capability is required.";
const CAPABILITY_DEPENDENCIES_DOC = "List of dependent capability IDs.";
const CAPABILITY_DOCS_DOC = "Optional documentation or description for this capability.";

// --- Example values ---
const CAPABILITY_ID_EXAMPLE = CapabilityId.PRICING;
const CAPABILITY_REVISION_EXAMPLE = 3;
const CAPABILITY_REQUIRED_EXAMPLE = true;
const CAPABILITY_DEPENDENCIES_EXAMPLE = #[];
const CAPABILITY_DOCS_EXAMPLE = "This capability enables booking creation.";

const CAPABILITY_EXAMPLE = #{
  id: CAPABILITY_ID_EXAMPLE,
  revision: CAPABILITY_REVISION_EXAMPLE,
  required: CAPABILITY_REQUIRED_EXAMPLE,
  dependencies: CAPABILITY_DEPENDENCIES_EXAMPLE,
  docs: CAPABILITY_DOCS_EXAMPLE
};

@example(CAPABILITY_EXAMPLE)
model Capability {
  @doc(CAPABILITY_ID_DOC)
  @example(CAPABILITY_ID_EXAMPLE)
  id: CapabilityId;

  @doc(CAPABILITY_REVISION_DOC)
  @example(CAPABILITY_REVISION_EXAMPLE)
  revision: int32;

  @doc(CAPABILITY_REQUIRED_DOC)
  @example(CAPABILITY_REQUIRED_EXAMPLE)
  required: boolean;

  @doc(CAPABILITY_DEPENDENCIES_DOC)
  @example(CAPABILITY_DEPENDENCIES_EXAMPLE)
  dependencies: CapabilityId[];

  @doc(CAPABILITY_DOCS_DOC)
  @example(CAPABILITY_DOCS_EXAMPLE)
  docs: string | null;
}