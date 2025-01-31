import "@typespec/openapi";

import "../../src/models/Option.tsp";
import "../../src/models/ContactField.tsp";
import "../../src/models/capabilities/Capability.tsp";

import "./OptionRestrictions.tsp";
import "./Unit.tsp";

import "./capabilities/ventrata-content/OptionContent.tsp";
import "./capabilities/packages/OptionPackages.tsp";
import "./capabilities/questions/OptionQuestions.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const OPTION_TAGS_DOC = "An array of tags that can be used to filter products.";
const OPTION_VISIBLE_CONTACT_FIELDS_DOC = "An array of the contact fields that are visible to the user when booking. These just apply to the lead traveller on the booking and not for every ticket.";

const OPTION_TAGS_EXAMPLE = #[];
const OPTION_VISIBLE_CONTACT_FIELDS_EXAMPLE = #[];

const OPTION_EXAMPLE = #{
  ...Octo.OPTION_EXAMPLE,
  tags: OPTION_TAGS_EXAMPLE,
  visibleContactFields: OPTION_VISIBLE_CONTACT_FIELDS_EXAMPLE,
  restrictions: OPTION_RESTRICTIONS_EXAMPLE,
  units: #[UNIT_EXAMPLE],
};

@example(OPTION_EXAMPLE)
model Option extends Octo.Option {
  @extension("x-order", 1)
  @extension("x-go-name", "capabilities")
  @extension("x-internal", true)
  @extension("x-go-type-skip-optional-pointer", true)
  @extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities?: Capability[];

  @extension("x-order", 2) id: string;

  @doc(OPTION_TAGS_DOC)
  @example(OPTION_TAGS_EXAMPLE)
  tags: string[];

  @doc(OPTION_VISIBLE_CONTACT_FIELDS_DOC)
  @example(OPTION_VISIBLE_CONTACT_FIELDS_EXAMPLE)
  visibleContactFields: ContactField[];

  @example(OPTION_RESTRICTIONS_EXAMPLE)
  restrictions: OptionRestrictions;

  units: Unit[];
  ...OptionContent;
  ...OptionPackages;
  ...OptionPricing;
  ...OptionQuestions;
}
