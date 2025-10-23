#import "/figures/tables.typ": *
#import "/utils/todo.typ": TODO

= Summary
This chapter summarizes the development of the testing framework for Theia Cloud. We discuss the status and functionality of the system as of
writing this thesis and provide an overview of the thesis's achievements and
remaining challenges. Finally, we discuss potential future work to enhance
the system's functionality.

== Status
This section provides an overview of the functional requiremtns of the testing framework, as presented in @functionalrequirements.

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

  A modular test architecture was designed that enables automated end-to-end and load testing of Online IDEs integrated into complex systems such as Artemis. The design separates the test logic from the system under test, allowing flexible deployment against self-hosted or external environments.
2. *Implementation of a Realistic End-to-End Test Suite*

  A test suite was developed to simulate authentic student workflows, including file editing, compilation, and terminal interaction. These tests validate both the functional correctness and responsiveness of the IDE, providing a foundation for future regression testing.
3. *Scalable Load Testing Setup*

  A load testing framework was introduced that can reproduce high concurrency scenarios to evaluate system performance under stress. By intentionally decoupling load testing from continuous integration pipelines, the framework ensures safe execution without affecting live or shared environments.
4. *Integration Strategy Between Artemis and Theia Cloud*

  A hybrid testing strategy was developed to handle the limited interoperability between Artemis' CI pipelines and external Theia instances. Tests were configured to run against deployed test servers, enabling realistic cross-system validation while maintaining a maintainable workflow.
5. *Exploration of Intelligent MCP-Based Testing*

  The thesis explored the integration of Model Context Protocol (MCP) agents as a future-oriented approach to simulate adaptive and autonomous user behavior. Although not yet deployable in automated pipelines, this represents an innovative direction for creating more dynamic and human-like test interactions.


== Conclusion
This thesis set out to develop and evaluate a systematic approach for testing the functionality and performance of an Online Integrated Development Environment used in an educational SaaS context. The main objective was to establish a reliable foundation for automated end-to-end and load testing that can realistically reproduce user behavior and reveal potential scalability limitations.

Through the design and implementation of a dedicated testing framework, it was demonstrated that comprehensive validation of an Online IDE is achievable even in the presence of restricted system access and distributed service architectures. The resulting test environment provides a practical means to assess both correctness and performance under real-world conditions, bridging the gap between controlled testing and production-like scenarios.

The work further emphasized the importance of balancing automation and manual evaluation when operating within managed infrastructure. By decoupling heavy load tests from continuous integration pipelines, the testing approach ensures both safety and flexibility for developers.

Finally, this thesis laid the groundwork for future advancements in intelligent, autonomous testing through the exploration of Model Context Protocol (MCP)–based agents. While still experimental, such approaches represent a promising direction toward more adaptive and human-like test behavior in complex online learning environments.

Overall, this work contributes to improving the reliability, scalability, and maintainability of cloud-based IDE platforms, supporting their continued use in large-scale educational settings.

== Future Work
This section discusses potential future work to enhance the system's functionality, especially the integration of the MCP testing framework into the Artemis E2E pipeline and the integration of the MCP testing framework into the Artemis E2E pipeline.

=== Automated Pipeline Execution
Alhtough integrating a automated pipeline execution was not feasible at the current stage, it is a promising future work to enhance the system's functionality. This would allow for the execution of the tests automatically in the CI/CD pipeline, which would be a major improvement in the development process. Regarding execution platform and conditions, it would be interesting to evaluate the performance of the tests on different platforms and conditions, such as different browsers, operating systems, and network conditions.

=== Automated MCP Testing
The integration of Model Context Protocol based testing is still in an experimental phase and not yet included in the automated test pipelines. The current MCP implementation requires connectivity to Anthropic's Claude #footnote("https://www.anthropic.com/") models and other specialized infrastructure components that are not available in the cloud-based testing environment. Several failures, including wrong indentation when pasting code into the editor, were encountered. Future work will focus on stabilizing the MCP testing components and integrating them into a dedicated pipeline once the necessary infrastructure becomes available.

=== LLM Testing for Artemis
The LLM testing framework could potentially be used to test the Artemis platform itself, by generating test cases for the Artemis platform and evaluating the performance of the platform under load. This would be a major improvement in the development process, as it would allow for the detection of performance bottlenecks and regressions in the Artemis platform itself, as well as the identification of potential security vulnerabilities.

=== Further Test Cases
Although the current test suite covers a wide range of functionalities, there are still some functionalities that are not covered by the test suite. As Online IDEs are a complex system and are constantly evolving, there are still many functionalities that are not covered by the test suite. Future work may focus on covering more functionalities and improving the test suite.