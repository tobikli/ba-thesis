#import "/utils/todo.typ": TODO
#pagebreak()
= Related Work

E2E testing has become an integral part of modern software development practices, enabling developers to validate the functionality of entire workflows from the perspective of the end user @paul:2001:EndtoendIntegrationTesting. In recent years, a variety of frameworks have emerged for E2E testing, with Playwright, developed by Microsoft, standing out due to its cross-browser support, reliable automation capabilities, and ease of integration into CI/CD pipelines.

== E2E Testing with Playwright

Playwright has been adopted across a wide range of projects, from web applications to complex interactive platforms. Its strengths lie in its ability to automate user interactions across multiple browsers (Chromium, Firefox, and WebKit), while offering features such as network interception, precise control over timeouts, and built-in support for parallel execution. Studies and case reports have demonstrated that Playwright is well-suited for verifying user flows that involve complex asynchronous operations, such as form submissions, authentication procedures, or real-time updates @halilaj::ComparativeEvaluationEndtoEnd.

Compared to earlier tools such as Selenium and Cypress, Playwright’s architectural design reduces test flakiness and improves reproducibility, which is critical in large-scale systems @halilaj::ComparativeEvaluationEndtoEnd. Several research efforts and industrial reports highlight the importance of reproducible E2E testing environments when simulating real-world usage under varying conditions @paul:2001:EndtoendIntegrationTesting.

== E2E Testing of Online IDEs

The testing of Online IDEs presents unique challenges due to their highly interactive and resource-intensive nature. Unlike traditional web applications, Online IDEs must support continuous user interaction in areas such as file editing, syntax highlighting, version control integration, and terminal execution. These interactions are not only event-driven but often require real-time feedback, making E2E testing a non-trivial task.

Although research on automated testing of Online IDEs is still limited, some initiatives have begun to explore automated validation of cloud-based programming environments. A notable example is a Bachelor thesis at Brno University of Technology, which developed a UI testing module for Eclipse Che with compatibility to the VS Code Extension Tester. The work highlights several core challenges: system libraries used in traditional local IDE testing cannot be reused in a cloud context, test stability is impacted on resource-constrained environments, and component abstractions must be introduced to allow cross-IDE compatibility. The module was built on Selenium WebDriver, which is the foundation of the VS Code Extension Tester. Selenium enabled simulation of user interactions with the graphical interface, but also introduced complexities such as managing multiple browser drivers and handling asynchronous waits. The author notes that while Selenium's explicit waits are essential, its implicit waits cannot be combined without causing unstable behavior, which complicates reliable test execution in CI environments @lorinc:2021:ExtensionEclipseChe.

In practice, most Online IDE test strategies focus on correctness of basic workflows (e.g., file creation, compilation, terminal commands) rather than large-scale stress testing. Thus, there exists a gap in research concerning how E2E testing frameworks can be systematically applied to Online IDEs in educational or exam settings.

== End-to-End Testing within Artemis

Artemis, the learning platform developed at the Technical University of Munich, has integrated automated testing approaches to ensure reliability of its features, including exercise management, grading pipelines, and interactive programming assignments. Within Artemis, E2E testing is employed to validate workflows that students and instructors rely on, such as creating exercises, submitting solutions, and receiving feedback.

Playwright has recently been introduced into the Artemis testing ecosystem to replace or complement Cypress-based setups, providing more robust and maintainable test suites @talibov::ImprovingStabilityWeb. Early efforts focus on automating the workflows around programming exercises, such as importing exercises, managing repositories, and simulating student submissions.

However, E2E testing in Artemis faces challenges similar to those of Online IDEs. Programming exercises rely on external tools and environments, such as IRIS and many different extended extensions. Current work in Artemis has primarily concentrated on verifying core platform workflows. Systematic large-scale E2E testing and especially load testing using E2E frameworks is still an open area of research.