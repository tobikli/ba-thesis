# Bachelor Thesis

This repository provides everything for my Bachelor Thesis in 2025 about Load Testing and Performance Evaluation of the Theia Online IDE. It was written at the Research Group [Applied Education Technologies](https://aet.cit.tum.de/) of the [Technical University of Munich](https://tum.de) under Guidance of Matthias Linhuber.

**Note:** The Thesis is based on the template of the Research Group which can be found [here](https://github.com/ls1intum/thesis-template-typst).

## About the Thesis

### Proposal

Theia Cloud provides a fully browser-based Integrated Development Environment (IDE), enabling users to write, execute, and manage code without local installations. Ensuring the reliability, usability, and scalability of Theia Cloud is critical, particularly as it is increasingly adopted in large-scale educational and enterprise environments. However, comprehensive automated testing for such a complex, interactive web application remains a challenge. Traditional unit and integration tests are insufficient for validating user-facing functionalities, and pure manual testing is impractical for a actively developed online IDE.

This thesis aims to address two key challenges in testing and performance evaluation of Theia Cloud:

1. End-to-End UI Testing
Theia Cloud provides a rich, interactive user interface with features such as code editing, file management, terminal access, and version control integration. Ensuring the correctness and stability of these features requires automated end-to-end (E2E) testing. Playwright, a modern testing framework for web applications, offers powerful capabilities for simulating real-world interactions across different browsers. The challenge lies in designing and implementing a robust test suite that covers critical functionalities while maintaining maintainability and efficiency.
2. Scalability and Load Testing
Beyond functional correctness, Theia Cloud must perform reliably under high user loads, especially in educational settings where many students simultaneously access the IDE. A system for stress testing Theia Cloud must be developed to simulate realistic user interactions at scale. This involves:

    1. Modeling realistic user behavior, including editing code, running programs, using terminals, and interacting with version control.
    2. Developing a scalable test infrastructure capable of spawning a large number of virtual users interacting with the system in parallel.
    3. Analyzing performance bottlenecks to identify potential issues such as high response times, UI lag, or backend failures under load.

By addressing these challenges, this thesis will contribute to improving the reliability and scalability of Theia Cloud, ensuring a seamless experience for users even under demanding workloads.

### Implementation

TODO
