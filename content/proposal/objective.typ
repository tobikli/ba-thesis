#import "../../utils/todo.typ": TODO

= Objective
This thesis aims to ensure the reliability, usability, and scalability of Theia Cloud within Artemis by developing a structured, automated testing framework. This involves both E2E UI testing and scalability testing, enabling the identification of performance bottlenecks under real-world conditions @paul:2001:EndtoendIntegrationTesting. The key objectives of this thesis are:
1.	Develop an automated Theia E2E testing
2.	Implement a scalable load testing framework
3.	Analyze system performance and identify bottlenecks
4.  Create randomized and personalized tests using LLMs

==  Develop an Automated Theia E2E Testing Suite

To ensure the correctness and stability of Theia Cloud's interactive features, this thesis develops an automated E2E test suite using Playwright #footnote("https://playwright.dev/")<pwr>. The tests cover essential functionalities, including code editing, file management, terminal interactions, and version control integration, as shown in @fig1. Since developers actively enhance Theia Cloud, automated tests help detect regressions and UI inconsistencies early in development.

This thesis designs the test suite to be maintainable and scalable, enabling future extensions as developers introduce new features. It pays special attention to handling asynchronous behavior, such as delayed UI updates and dynamic content loading, challenges commonly encountered in web-based IDEs. The implementation includes test automation best practices, such as using selectors resilient to UI changes and structuring tests modularly for reusability.

The suite integrates tests for interactions with Artemis directly into Artemis' existing CI/CD pipeline, automatically validating any changes to Theia Cloud against the test suite. This integration helps maintain a high level of confidence in the system's correctness and stability, reducing the risk of regressions and improving overall user experience.

#figure(
  image("/figures/proposal/sequence_diagram.svg", height: 85%),
  caption: [Sequence diagram of a complete End-to-End test scenario for Theia Cloud integrated with Artemis],
) <fig1>



== Implement a Scalable Load Testing Framework

In educational settings, Theia Cloud must support hundreds of students working simultaneously, especially during programming exams @turdiu:2020:OnlineExamsArtemis. However, developers have not yet systematically tested its ability to handle high user loads. This thesis develops a load testing framework, as seen in @fig2, that can simulate realistic student interactions at scale. For illustration, the diagram presents a simplified architecture of the load testing framework using an arbitrary number of instances of Theia Cloud. In reality, the framework scales up to a large number of instances of Theia Cloud, depending on the available resources.
The test suite performs functional and scalability testing by interfacing with individual Theia instances using Playwright. It emulates user interactions by targeting UI elements through CSS selectors in a controlled, headless browser context.

The framework models typical user workflows such as editing code, executing programs, and using the terminal to replicate real-world usage patterns. The tests measure latency, response times, and resource consumption under increasing load. They also identify the system's breaking point, where performance degrades or failures occur, to support targeted optimizations. The goal is to develop a scalable and repeatable methodology for evaluating the performance of Theia Cloud over time.



This thesis sets up a separate testing environment to ensure that scaled tests do not interfere with the CI/CD development process. This environment is isolated from the production system, allowing for extensive load testing without impacting real users or pipeline building.

#figure(
  image("/figures/proposal/deployment_diagram.svg", width: 100%),
  caption: [Deployment Diagram of the scalable load testing framework using N instances of Theia Cloud],
) <fig2>

== Analyze System Performance and Identify Bottlenecks

An important aspect of performance evaluation is understanding how system components behave under load. This thesis uses Grafana and other available monitoring tools to analyze key performance metrics, including CPU and memory usage, response times, and request throughput.

By correlating test results with system metrics, this analysis provides actionable insights into performance bottlenecks, such as slow UI interactions, server-side processing delays, or database constraints. The goal is to comprehensively evaluate Theia Cloud's scalability limits, helping system administrators and developers make informed decisions about optimizations and infrastructure scaling.

#pagebreak()

== Create Randomized and Personalized Tests Using LLMs

The Model Context Protocol #footnote("https://modelcontextprotocol.io/")  (MCP) is a tool for interacting with LLMs with context. By leveraging the MCP, this thesis also explores the possibility of generating tests that adapt to individual user profiles, preferences, and learning styles. This approach aims to enhance the realism and relevance of the testing scenarios, making them more representative of actual user interactions.

The thesis uses the MCP to create diverse test cases covering various programming languages, IDE features, and user behaviors. This allows for a more comprehensive evaluation of Theia Cloud's capabilities and performance under different conditions. The MCP component integrates the generated tests into the existing E2E test suite and thoroughly tests the system across various scenarios.
