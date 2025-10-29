#import "/figures/tables.typ": *
#import "/utils/todo.typ": TODO

#pagebreak()

= Summary
This chapter summarizes the development of the testing framework for Theia Cloud. We discuss the system's status and functionality as of this thesis's writing and provide an overview of the thesis's achievements and
remaining challenges. Finally, we discuss potential future work to enhance
the system's functionality.

== Status
This section provides an overview of the status of the functional requirements as of the writing of this thesis, as presented in @functionalrequirements.

#figure(
  status-table,
  caption: [Status of the testing framework],
)
#align(center)[
● Implemented -
◐ Partially implemented
]

1. *Design of a Test Architecture for Cloud-Based IDEs*

 We designed a modular test architecture to enable automated end-to-end and load testing of online IDEs integrated into complex systems such as Artemis. The design separates the test logic from the system under test, allowing flexible deployment against self-hosted or external environments.
2. *Implementation of a Realistic End-to-End Test Suite*

 We developed a test suite to simulate authentic student workflows, including file editing, compilation, and terminal interaction. These tests validate the IDE's functional correctness and responsiveness, providing a foundation for future regression testing.
3. *Scalable Load Testing Setup*

 The project introduced a load testing framework that reproduces high-concurrency scenarios to evaluate system performance under stress. By intentionally decoupling load testing from continuous integration pipelines, the framework ensures safe execution without affecting live or shared environments.
4. *Integration Strategy Between Artemis and Theia Cloud*

 We developed a hybrid testing strategy to handle the limited interoperability between Artemis' CI pipelines and external Theia instances. The configuration runs tests against deployed test servers, enabling realistic cross-system validation while preserving a maintainable workflow.
5. *Exploration of Intelligent MCP-Based Testing*

 The thesis explored the integration of Model Context Protocol (MCP) agents as a future-oriented approach to simulate adaptive and autonomous user behavior. Although not yet deployable in automated pipelines, this represents an innovative direction for creating more dynamic and human-like test interactions.


== Conclusion
This thesis sets out to develop and evaluate a systematic approach to testing the functionality and performance of an Online Integrated Development Environment used in an educational SaaS context. The main objective was to establish a reliable foundation for automated end-to-end and load testing that can realistically reproduce user behavior and reveal potential scalability limitations.

The design and implementation of a dedicated testing framework demonstrated that comprehensive validation of an Online IDE is achievable even with restricted system access and distributed service architectures. The resulting test environment provides a practical means to assess correctness and performance under real-world conditions, bridging the gap between controlled testing and production-like scenarios.

The work further emphasized balancing automation and manual evaluation when operating within a managed infrastructure. By decoupling heavy load tests from continuous integration pipelines, the testing approach ensures both safety and flexibility for developers.

Finally, this thesis laid the groundwork for future advancements in intelligent, autonomous testing by exploring Model Context Protocol (MCP)–based agents. While still experimental, such approaches represent a promising direction toward more adaptive and human-like test behavior in complex online learning environments.

Overall, this work improves cloud-based IDE platforms' reliability, scalability, and maintainability, supporting their continued use in large-scale educational settings.

== Future Work
This section discusses potential future work to enhance the system's functionality, especially the integration of the MCP testing framework into the Artemis E2E pipeline and the integration of the MCP testing framework into the Artemis E2E pipeline.

While this thesis establishes a solid foundation for automated end-to-end and load testing of cloud-based IDEs, several directions remain for future research and development. Each proposed area represents an opportunity for a dedicated follow-up project or thesis to extend and refine the system's capabilities.

=== Automated Pipeline Execution
A significant next step is integrating the testing framework into a fully automated continuous integration and deployment (CI/CD) pipeline. Such integration would enable the execution of end-to-end and regression tests automatically upon new code submissions or deployments, thereby ensuring that functional and performance regressions are detected early in the development cycle.

Future work could focus on designing a scalable and resource-aware pipeline architecture that allows automated test execution without interfering with production environments. This would involve dynamic environment provisioning (e.g., ephemeral test instances for Theia Cloud and Artemis) and result aggregation for trend analysis over multiple runs.
A comparative evaluation across different execution platforms, such as various browsers, operating systems, and network conditions, could reveal platform-specific weaknesses and help optimize the testing setup for educational contexts. Such an effort would significantly increase confidence in each release and provide developers with actionable performance metrics directly integrated into their workflow.

=== Automated MCP Testing
Integrating Model Context Protocol-based testing into the automated testing pipeline represents another promising direction. MCP introduces the ability to test user interfaces through autonomous agents driven by large language models, allowing the simulation of realistic and adaptive user behavior rather than strictly scripted interactions.

Future research could aim to stabilize and generalize the MCP integration, addressing the current technical limitations, such as unreliable text input, code formatting inconsistencies, and dependency on external model providers (e.g., Anthropic Claude or OpenAI models). Once stabilized, this setup could be connected to a dedicated CI pipeline to automatically validate new IDE versions using LLM-driven agents.
A subsequent thesis could evaluate how well LLMs can learn to interact with development environments, how consistent their behavior is across different prompts, and how effectively they can detect UI or workflow regressions without explicit scripting.


=== LLM Testing for Artemis
Beyond testing the IDE, we could extend the LLM-based testing framework to automatically test the Artemis learning platform. Let LLM agents generate and execute test cases for Artemis features such as exercise creation, submission handling, or grading workflows. This would represent a significant leap toward autonomous system-level testing.

Future work could focus on integrating LLM-based behavior generation with Artemis' REST API to automatically construct diverse, high-coverage test scenarios. In addition to correctness verification, these tests could include load and stress evaluations, providing valuable data on system performance under real-world conditions.
Such a project could also explore the potential for AI-assisted security testing, where LLMs attempt to identify potential vulnerabilities by generating adversarial inputs or edge cases, an area with strong research potential in educational platforms.

=== Further Test Cases
Although the current test suite covers a broad set of IDE functionalities, Online IDEs are continuously evolving systems with growing feature sets. Future work should therefore focus on systematically extending test coverage, especially for features that involve collaborative editing, real-time synchronization, or advanced debugging capabilities.

A potential follow-up thesis could focus on creating a comprehensive test generation framework, leveraging LLMs or model-based testing techniques to derive test cases directly from use-case descriptions or system models. This would improve coverage and reduce the maintenance effort for large test suites. Additionally, comparative studies could be conducted to assess the effectiveness and stability of these automatically generated tests against traditional scripted tests, contributing valuable insights to software testing automation.