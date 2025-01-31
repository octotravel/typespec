import "@typespec/openapi";

import "../../src/models/Contact.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const CONTACT_TAX_ID_EXAMPLE = "";
const CONTACT_STREET_ADDRESS_EXAMPLE = "";
const CONTACT_CITY_EXAMPLE = "";
const CONTACT_STATE_EXAMPLE = "";
const CONTACT_ALLOW_MARKETING_EXAMPLE = true;

const CONTACT_EXAMPLE = #{
  ...Octo.CONTACT_EXAMPLE,
  taxId: CONTACT_TAX_ID_EXAMPLE,
  streetAddress: CONTACT_STREET_ADDRESS_EXAMPLE,
  city: CONTACT_CITY_EXAMPLE,
  state: CONTACT_STATE_EXAMPLE,
  allowMarketing: CONTACT_ALLOW_MARKETING_EXAMPLE,
};

@example(CONTACT_EXAMPLE)
model Contact extends Octo.Contact {
  /**
   * The tax ID of the booking holder or the ticket holder.
   */
  @example(CONTACT_TAX_ID_EXAMPLE)
  taxId: string | null;

  /**
   * The street address of the booking holder or the ticket holder.
   */
  @example(CONTACT_STREET_ADDRESS_EXAMPLE)
  streetAddress: string | null;

  /**
   * The city of the booking holder or the ticket holder.
   */
  @example(CONTACT_CITY_EXAMPLE)
  city: string | null;

  /**
   * The state of the booking holder or the ticket holder.
   */
  @example(CONTACT_STATE_EXAMPLE)
  state: string | null;

  /**
   * Whether the booking holder or the ticket holder allows marketing.
   */
  @example(CONTACT_ALLOW_MARKETING_EXAMPLE)
  allowMarketing: boolean;
}
