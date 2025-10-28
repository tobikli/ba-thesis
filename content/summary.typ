#import "/figures/tables.typ": *
#import "/utils/todo.typ": TODO

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

#pagebreak()

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

The design and implementation of a dedicated testing framework demonstrated that comprehensive validation of an Online IDE is achievable even in the presence of restricted system access and distributed service architectures. The resulting test environment provides a practical means to assess correctness and performance under real-world conditions, bridging the gap between controlled testing and production-like scenarios.

The work further emphasized balancing automation and manual evaluation when operating within a managed infrastructure. By decoupling heavy load tests from continuous integration pipelines, the testing approach ensures both safety and flexibility for developers.

Finally, this thesis laid the groundwork for future advancements in intelligent, autonomous testing by exploring Model Context Protocol (MCP)–based agents. While still experimental, such approaches represent a promising direction toward more adaptive and human-like test behavior in complex online learning environments.

Overall, this work improves cloud-based IDE platforms' reliability, scalability, and maintainability, supporting their continued use in large-scale educational settings.

== Future Work
This section discusses potential future work to enhance the system's functionality, especially the integration of the MCP testing framework into the Artemis E2E pipeline and the integration of the MCP testing framework into the Artemis E2E pipeline.

=== Automated Pipeline Execution
Although integrating an automated pipeline execution was not feasible at the current stage, it is a promising future work to enhance the system's functionality. This integration allows for the automatic execution of the tests in the CI/CD pipeline, significantly improving the development process. Regarding execution platform and conditions, it would be interesting to evaluate the performance of the tests on different platforms and conditions, such as different browsers, operating systems, and network conditions.

=== Automated MCP Testing
The integration of Model Context Protocol based testing is still experimental and not yet included in the automated test pipelines. The current MCP implementation requires connectivity to Anthropic's Claude #footnote("https://www.anthropic.com/") models and other specialized infrastructure components unavailable in the cloud-based testing environment. We encountered several failures, including wrong indentation when pasting code into the editor. Future work will focus on stabilizing the MCP testing components and integrating them into a dedicated pipeline once the necessary infrastructure becomes available.

=== LLM Testing for Artemis
We could use the LLM testing framework to test the Artemis platform itself by generating test cases for the Artemis platform and evaluating the performance of the platform under load. Therefore, we would significantly improve the development process, as it would allow for detecting performance bottlenecks and regressions in the Artemis platform itself and identifying potential security vulnerabilities.

=== Further Test Cases
Although the current test suite covers a wide range of functionalities, there are still some functionalities that the test suite does not cover. As online IDEs are complex systems that are constantly evolving, many functionalities are still not covered by the test suite. Future work may focus on covering more functionalities and improving the test suite.