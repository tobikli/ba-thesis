#import "../../utils/todo.typ": TODO

= Objective
The goal of this thesis is to ensure the reliability, usability, and scalability of Theia Cloud within Artemis by developing a structured automated testing framework. This involves both End-to-End (E2E) UI testing and scalability testing, enabling the identification of performance bottlenecks under real-world conditions @paul:2001:EndtoendIntegrationTesting. The key objectives of this thesis are:
	1.	Develop an automated End-to-End (E2E) testing suite using Playwright
	2.	Implement a scalable load testing framework to evaluate system performance under high concurrent usage
	3.	Analyze system performance and identify bottlenecks using Grafana and other monitoring tools

==  Develop an automated End-to-End (E2E) testing suite using Playwright

To ensure the correctness and stability of Theia Cloud’s interactive features, this thesis will develop an automated E2E test suite using Playwright #footnote("https://playwright.dev/") <pwr>. The tests will cover essential functionalities, including code editing, file management, terminal interactions, and version control integration as shown in @fig1. Since Theia Cloud is actively developed, automated testing is necessary to detect regressions and UI inconsistencies early in the development process.

The E2E test suite will be designed to be maintainable and scalable, allowing future extensions as new features are introduced. Special attention will be given to handling asynchronous behavior, such as delayed UI updates and dynamic content loading, which are common in web-based IDEs. The implementation will include test automation best practices, such as using selectors resilient to UI changes and structuring tests modularly for reusability.

#figure(
  image("../../figures/proposal_diagram.svg", width: 80%),
  caption: [Sequence Diagram of an example E2E Test],
) <fig1>

== Implement a scalable load testing framework to evaluate system performance under high concurrent usage

In educational settings, Theia Cloud must support hundreds of students working simultaneously, especially during programming exams @turdiu:2020:OnlineExamsArtemis. However, its ability to handle high user loads has not been systematically tested. This thesis will develop a load testing framework that can simulate realistic student interactions at scale.

The framework will model typical user workflows, including editing code, executing programs, and interacting with the terminal, to replicate real-world usage patterns. The tests will assess latency, response times, and resource consumption under increasing user loads. The system’s breaking point, where performance degrades or failures occur, will be identified to provide insights for potential optimizations. The focus will be on developing a scalable and repeatable methodology that can be used for ongoing performance evaluations.

== Analyze system performance and identify bottlenecks using Grafana and other monitoring tools

A crucial aspect of performance evaluation is understanding how system components behave under load. This thesis will use Grafana, combined with other available monitoring tools, to analyze key performance metrics, including CPU and memory usage, response times, and request throughput.

By correlating test results with system metrics, this analysis will provide actionable insights into performance bottlenecks, such as slow UI interactions, backend processing delays, or database constraints. The goal is to deliver a comprehensive evaluation of Theia Cloud’s scalability limits, helping system administrators and developers make informed decisions about optimizations and infrastructure scaling.