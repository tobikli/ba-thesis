#import "/utils/todo.typ": TODO

= System Design
#TODO[
  This chapter follows the System Design Document Template in @bruegge:2004:ObjectorientedSoftwareEngineering. You describe in this chapter how you map the concepts of the application domain to the solution domain. Some sections are optional, if they do not apply to your problem. Cite @bruegge:2004:ObjectorientedSoftwareEngineering several times in this chapter.
]

== Overview
#TODO[
  Provide a brief overview of the software architecture and references to other chapters (e.g. requirements analysis), references to existing systems, constraints impacting the software architecture..
]

== Design Goals
#TODO[
  Derive design goals from your nonfunctional requirements, prioritize them (as they might conflict with each other) and describe the rationale of your prioritization. Any trade-offs between design goals (e.g., build vs. buy, memory space vs. response time), and the rationale behind the specific solution should be described in this section
]

== Functional Testing

=== Activity Diagram
Das Playwright Activity Diagram für die functional tests.
#figure(
  image("/figures/activity_complex_workflow.drawio.svg", height: 70%),
  caption: [Activity Diagram of functional tests workflow],
)

=== Sequence Diagram
Das Playwright Sequence Diagram für die Artemis Integration.
#figure(
  image("/figures/artemis_sequence.svg", width: 100%),
  caption: [Sequence Diagram of Artemis Integration Test],
)

== Load Testing

=== Subsystem Decomposition
D


=== Deployment Diagram
Das Artillery.io Deployment Diagram.
#figure(
  image("/figures/load_architecture.drawio.svg", width: 100%),
  caption: [Deployment Diagram of Load Testing Architecture using Artillery and N instances of a Theia Session],
)

== MCP Testing

=== Hardware Software Mapping
Beide Subsysteme zeigen (local und remote)
#figure(
  image("/figures/mcp_local.drawio.svg", width: 100%),
  caption: [Hardware Software Mapping of MCP running locally],
)

#figure(
  image("/figures/mcp_remote.drawio.svg", width: 100%),
  caption: [Hardware Software Mapping of MCP running in CI/CD],
)


=== Activity Diagram
Beide bzw. wenn nur das komplexe
#figure(
  image("/figures/activity_mcp_complex.drawio.svg", width: 80%),
  caption: [Activity Diagram of standalone MCP Client Connection],
)