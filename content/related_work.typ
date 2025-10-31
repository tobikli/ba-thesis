#import "/utils/todo.typ": TODO
#pagebreak()
= Related Work

E2E testing has become an integral part of modern software development practices, enabling developers to validate entire workflows' functionality from the end user's perspective @paul:2001:EndtoendIntegrationTesting. In recent years, a variety of frameworks have emerged for E2E testing, with Playwright #footnote("https://playwright.dev/")<pwr>, developed by Microsoft, standing out due to its cross-browser support, reliable automation capabilities, and ease of integration into CI/CD pipelines.

== E2E Testing With Playwright

Various projects have adopted Playwright, from web applications to complex interactive platforms. Its strengths lie in its ability to automate user interactions across multiple browsers (Chromium, Firefox, and WebKit), while offering features such as network interception, precise control over timeouts, and built-in support for parallel execution. Studies and case reports have demonstrated that Playwright is well-suited for verifying user flows that involve complex asynchronous operations, such as form submissions, authentication procedures, or real-time updates @halilaj:2025:ComparativeEvaluationEndtoEnd.

Compared to earlier tools such as Selenium and Cypress, Playwright's architectural design reduces test flakiness and improves reproducibility, critical in large-scale systems @halilaj:2025:ComparativeEvaluationEndtoEnd. Several research efforts and industrial reports highlight the importance of reproducible E2E testing environments when simulating real-world usage under varying conditions @paul:2001:EndtoendIntegrationTesting. 

=== Use Case Scenario
Playwright provides several benefits to the scenario addressed in this thesis. First, it enables the automation of student workflows in the IDE through realistic browser-driven interactions, such as editing code, running programs, and using version control. Second, its reliability in handling dynamic content and asynchronous operations is essential, since online IDEs often involve real-time updates and collaborative features. Third, Playwright integrates well with modern development environments. It can be easily extended with load testing tools or monitoring systems, making it a suitable foundation for correctness testing and performance evaluation. Finally, its open-source nature and active community support ensure long-term maintainability and adaptability to evolving requirements.

== E2E Testing Of Online IDEs

The testing of Online IDEs presents unique challenges due to their highly interactive and resource-intensive nature. Unlike traditional web applications, Online IDEs must support continuous user interaction in file editing, syntax highlighting, version control integration, and terminal execution. These event-driven interactions often require real-time feedback, making E2E testing a non-trivial task.

Although research on automated testing of Online IDEs is still limited, some initiatives have begun to explore automated validation of cloud-based programming environments. A notable example is a bachelor's thesis at Brno University of Technology, which developed a UI testing module for Eclipse Che compatible with the VS Code Extension Tester. The thesis highlights several core challenges: testers cannot reuse system libraries from traditional local IDE testing in a cloud context, resource constraints reduce test stability, and developers must introduce component abstractions to enable cross-IDE compatibility. The module builds on Selenium WebDriver, which forms the foundation of the VS Code Extension Tester. Selenium enabled simulation of user interactions with the graphical interface, but also introduced complexities such as managing multiple browser drivers and handling asynchronous waits. The author notes that while Selenium's explicit waits are essential, its implicit waits cannot be combined without causing unstable behavior, complicating reliable test execution in CI environments @lorinc:2021:ExtensionEclipseChe.

In practice, most Online IDE test strategies focus on the correctness of basic workflows (e.g., file creation, compilation, terminal commands) rather than large-scale stress testing. Thus, a research gap exists concerning how developers can systematically apply E2E testing frameworks to Online IDEs in educational or exam settings.

== E2E Testing Within Artemis

Artemis, the learning platform developed at the Technical University of Munich, has integrated automated testing approaches to ensure the reliability of its features, including exercise management, grading pipelines, and interactive programming assignments. Within Artemis, the system utilizes E2E testing to validate workflows that students and instructors rely on, such as creating exercises, submitting solutions, and receiving feedback.

Playwright has recently been introduced into the Artemis testing ecosystem to replace or complement Cypress-based setups, providing more robust and maintainable test suites @talibov:2024:ImprovingStabilityWeb. Early efforts focus on automating the workflows around programming exercises, such as importing exercises, managing repositories, and simulating student submissions.

However, E2E testing in Artemis faces challenges similar to those of Online IDEs. Programming exercises rely on external tools and environments, such as IRIS and many different extensions. Current work in Artemis has primarily concentrated on verifying core platform workflows. Systematic large-scale E2E testing, especially load testing, using E2E frameworks, is still an open area of research.
