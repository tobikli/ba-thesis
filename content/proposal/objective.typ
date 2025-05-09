#import "../../utils/todo.typ": TODO


= Objective
The goal of this thesis is to ensure the reliability, usability, and scalability of Theia Cloud within Artemis by developing a structured, automated testing framework. This involves both End-to-End (E2E) UI testing and scalability testing, enabling the identification of performance bottlenecks under real-world conditions @paul:2001:EndtoendIntegrationTesting. The key objectives of this thesis are:
1.	Develop an automated End-to-End (E2E) testing suite using Playwright
2.	Implement a scalable load testing framework to evaluate system performance 
3.	Analyze system performance and identify bottlenecks using monitoring tools
4.  Create randomized and personalized tests using LLMs (Optional)

==  Develop an automated End-to-End (E2E) testing suite using Playwright

To ensure the correctness and stability of Theia Cloud's interactive features, this thesis will develop an automated E2E test suite using Playwright #footnote("https://playwright.dev/")<pwr>. The tests will cover essential functionalities, including code editing, file management, terminal interactions, and version control integration, as shown in @fig1. Since Theia Cloud is actively developed, automated testing is necessary to detect regressions and UI inconsistencies early in the development process.

The E2E test suite will be designed to be maintainable and scalable, allowing future extensions as new features are introduced. Special attention will be given to handling asynchronous behavior, such as delayed UI updates and dynamic content loading, which are common in web-based IDEs. The implementation will include test automation best practices, such as using selectors resilient to UI changes and structuring tests modularly for reusability.

Tests regarding interaction with Artemis will be integrated into the existing CI/CD pipeline of Artemis, ensuring that any changes to Theia Cloud are automatically validated against the test suite. This integration will help maintain a high level of confidence in the system's correctness and stability, reducing the risk of regressions and improving overall user experience.

#figure(
  image("/figures/proposal/sequence_diagram.svg", width: 80%),
  caption: [Sequence Diagram of an example E2E Test],
) <fig1>

== Implement a scalable load testing framework to evaluate system performance under high concurrent usage

In educational settings, Theia Cloud must support hundreds of students working simultaneously, especially during programming exams @turdiu:2020:OnlineExamsArtemis. However, its ability to handle high user loads has not been systematically tested. This thesis will develop a load testing framework, as seen in @fig2, that can simulate realistic student interactions at scale. For illustration, the diagram shows a simplified architecture of the load testing framework, where only 2 instances of Theia Cloud are used. In reality, the framework will be able to scale up even more instances of Theia Cloud, depending on the available resources.

The framework will model typical user workflows, including editing code, executing programs, and interacting with the terminal to replicate real-world usage patterns. The tests will assess latency, response times, and resource consumption under increasing user loads. The system's breaking point, where performance degrades, or failures occur, will be identified to provide insights for potential optimizations. The focus will be on developing a scalable and repeatable methodology that can be used for ongoing performance evaluations.

A separate testing environment will be set up to ensure that scaled tests do not interfere with the CI/CD development process. This environment will be isolated from the production system, allowing for extensive load testing without impacting real users or pipeline building.

#figure(
  image("/figures/proposal/Component_Diagram.png", width: 80%),
  caption: [Component Diagram of the scalable load testing framework using 2 instances of Theia Cloud],
) <fig2>

== Analyze system performance and identify bottlenecks using monitoring tools

A crucial aspect of performance evaluation is understanding how system components behave under load. This thesis will use Grafana, combined with other available monitoring tools, to analyze key performance metrics, including CPU and memory usage, response times, and request throughput.

By correlating test results with system metrics, this analysis will provide actionable insights into performance bottlenecks, such as slow UI interactions, backend processing delays, or database constraints. The goal is to deliver a comprehensive evaluation of Theia Cloud's scalability limits, helping system administrators and developers make informed decisions about optimizations and infrastructure scaling.

== Create randomized and personalized tests using LLMs (Optional)

The Model Context Protocol (MCP) is a tool for interacting with LLMs with context. By leveraging the MCP, this thesis will explore the possibility of generating tests that adapt to individual user profiles, preferences, and learning styles. This approach aims to enhance the realism and relevance of the testing scenarios, making them more representative of actual user interactions.

The MCP will be used to create a diverse set of test cases that cover various programming languages, IDE features, and user behaviors. This will allow for a more comprehensive evaluation of Theia Cloud's capabilities and performance under different conditions. The generated tests will be integrated into the existing E2E test suite, ensuring that the system is thoroughly tested across a wide range of scenarios.
