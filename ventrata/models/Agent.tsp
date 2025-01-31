namespace Ventrata;

const AGENT_ID_DOC = "A unique ID / UUID generated to identify the agent.";
const AGENT_NAME_DOC = "Agent name.";
const AGENT_REFERENCE_DOC = "Agent reference.";
const AGENT_TAGS_DOC = "An array of tags that can be used to filter.";

const AGENT_ID_EXAMPLE = "";
const AGENT_NAME_EXAMPLE = "";
const AGENT_REFERENCE_EXAMPLE = null;
const AGENT_TAGS_EXAMPLE = #[];

const AGENT_EXAMPLE = #{
  id: AGENT_ID_EXAMPLE,
  name: AGENT_NAME_EXAMPLE,
  reference: AGENT_REFERENCE_EXAMPLE,
  tags: AGENT_TAGS_EXAMPLE,
};

@example(AGENT_EXAMPLE)
model Agent {
  @doc(AGENT_ID_DOC)
  @example(AGENT_ID_EXAMPLE)
  @format("uuid")
  id: string;

  @doc(AGENT_NAME_DOC)
  @example(AGENT_NAME_EXAMPLE)
  name: string;

  @doc(AGENT_REFERENCE_DOC)
  @example(AGENT_REFERENCE_EXAMPLE)
  reference: string | null;

  @doc(AGENT_TAGS_DOC)
  @example(AGENT_TAGS_EXAMPLE)
  tags: string[];
}
