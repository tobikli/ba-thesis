#import "/utils/todo.typ": TODO
#import "/figures/tables.typ": *

#pagebreak()

= Requirements
This chapter outlines the requirements for the automated testing framework for Theia Cloud, based on the requirements analysis by Bruegge et al. @bruegge:2004:ObjectorientedSoftwareEngineering.
It begins with an overview of the envisioned solution in @overview, followed by a presentation of several dynamic models in @dynamicmodels. We will continue with a structured presentation of the proposed system in @proposedsystem, which derives the functional and non-functional requirements from the system models in @functionalrequirements and @nonfunctionalrequirements. These requirements are the foundation for the subsequent design, implementation, and evaluation phases.

== Overview <overview>
The primary objective of this thesis is to define, design, and evaluate a system capable of performing automated E2E testing and load testing for an Online Integrated Development Environment. The system aims to provide a reliable and repeatable method for assessing both the functional correctness and performance of the IDE under realistic conditions. Simulating user interactions at scale enables the identification of potential bottlenecks, stability issues, and areas for optimization before they impact real users. Furthermore, the system is intended to support continuous evaluation, allowing developers and administrators to maintain high-quality, scalable IDE deployments over time. Overall, the goal is to create a comprehensive testing framework that enhances confidence in the IDE's reliability, responsiveness, and suitability for large-scale educational use.

== Dynamic Models <dynamicmodels>
To better illustrate the requirements and interactions of the proposed system, we present two dynamic models.

=== Activity Diagram
The activity diagram shown in @fig3 showcases a typical student workflow for an IDE. It starts with the student opening the IDE, potentially changing preferences in the UI and the behavior of the IDE, installing project-specific extensions, cloning a repository, editing the code, running the code, and committing and pushing the changes to the remote repository.

#figure(
  image("/figures/activity_ide_use.drawio.svg", height: 70%),
  caption: [Activity Diagram showcasing a typical student workflow for the IDEs],
) <fig3>

#pagebreak()

=== Use Case Model
Focusing on integrating the IDE with Artemis, we can derive the following use case models, as shown in @fig4.

#figure(
  image("/figures/usecase_ide.drawio.svg", width: 100%),
  caption: [Use Case for Online IDEs integrated with Artemis],
) <fig4>

Students primarily interact with the IDE to perform programming tasks. Their core use cases include compiling and running code, accessing language server features such as code completion or error highlighting, and submitting code to Artemis for assignments or exams. These use cases reflect typical workflows in computer science courses and emphasize the importance of an IDE that behaves reliably under load, especially in exam settings where hundreds of students may be active simultaneously.

Instructors, on the other hand, rely on the IDE and its integration with Artemis to support teaching activities. Their use cases include ensuring that language tools are available out of the box, without requiring manual setup for different programming languages. They also require secure authentication and session management, both to protect student data and to enforce academic integrity. Furthermore, instructors expect the system to be scalable, capable of supporting many concurrent users without performance degradation, and to be seamlessly connected with exams and exercises hosted on Artemis. These requirements ensure that instructors can confidently use the IDE for both regular coursework and high-stakes assessments.

Together, these use cases highlight the dual perspective of students and instructors and underscore the system's role as a bridge between interactive coding environments and the educational infrastructure provided by Artemis. By analyzing these use cases, we can identify the requirements for the system under test and conclude the functional requirements for the proposed functional testing system.

== Proposed System <proposedsystem>
We propose a new system because there is currently no system that can perform automated E2E testing and load testing for an Online Integrated Development Environment IDE. 

=== Functional Requirements <functionalrequirements>
By assessing the previous dynamic models, we can derive the following functional requirements and quality attributes, according to the requirements analysis by Bruegge et al. @bruegge:2004:ObjectorientedSoftwareEngineering:

- *FR1. Simulate User Interactions*:
The system must simulate realistic user interactions within the IDE, including opening, editing, and saving files, using the terminal to compile and run programs, managing projects or exercises, and performing version control operations such as committing, pushing, and pulling changes. It must support the execution of sequences of actions that accurately mimic real student workflows.

#pagebreak()

- *FR2. Automated End-to-End Testing*:
The system must provide automated E2E testing capabilities to verify the correctness of IDE features. It should allow test scenarios to be defined, reused, and parameterized to cover different workflows and use cases, and it must detect errors or failures in core functionality.

- *FR3. Load and Performance Testing*:
The system must also support load and performance testing by simulating multiple concurrent users. It should measure response times, throughput, and error rates under varying levels of load, and it must be capable of reproducing peak usage scenarios, such as those observed during exams or large-scale course sessions.

- *FR4. Monitoring and Reporting*:
During testing, the system must collect relevant performance and behavioral metrics. It should generate detailed reports summarizing test results, errors, and bottlenecks, and provide visualizations or summaries easily interpretable by developers and system administrators.

- *FR5. Scenario Management*:
The system must allow test scenarios to be defined, configured, and managed efficiently, including the ability to configure user behavior profiles and test parameters, and to enable repeatable execution of scenarios for regression testing and validation of system stability over time.

- *FR6. Integration with Intelligent Agents*:
The system should support integration of intelligent agents based on the Model Context Protocol. These agents can simulate adaptive and realistic student behavior, and their behavior should be customizable to represent different skill levels or interaction patterns.

#pagebreak()

=== Quality Attributes & Constraints <nonfunctionalrequirements>
This section lists the requirements not directly related to the system's functionality. We categorize them using the FURPS+ model (Functionality, Usability, Reliability, Performance, Supportability, and Constraints)  described in @bruegge:2004:ObjectorientedSoftwareEngineering:

- *NFR1. Concurrent Test Execution (Performance)*: <NFR1>
The system must handle high-performance requirements, such as the ability to simulate complex workflows and measure response times, throughput, and error rates under varying levels of load.

- *NFR2. Reproducible Test Results (Reliability)*: <NFR2>
The system must handle high reliability requirements, such as the ability to reproduce test results and detect errors or failures in core functionality.

- *NFR3. User Behavior Profiles (Usability)*: <NFR3>
The system must handle high usability requirements, such as the ability to configure user behavior profiles and test parameters, and to enable repeatable execution of scenarios for regression testing and validation of system stability over time, as seen in @figui.

#figure(
  image("/figures/test-ui.png", width: 80%),
  caption: [Playwright UI for repeatable test execution and evaluation],
) <figui>

#pagebreak()

- *NFR4. Scalable Test Execution (Performance / Reliability)*: <NFR4>
The system must be able to handle scalability requirements, such as the ability to simulate multiple concurrent users and the ability to measure response times, throughput, and error rates under varying levels of load.

- *NFR5. Cross-Platform Compatibility (Supportability)*: <NFR5>
The system must be able to handle portability requirements, such as the ability to run on different platforms and the ability to integrate with different systems.

- *NFR6. Data Security (Constraint)*: <NFR6>
The system should ensure that simulated interactions do not compromise IDE user data or access controls.


