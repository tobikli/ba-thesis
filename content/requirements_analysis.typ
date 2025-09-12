#import "/utils/todo.typ": TODO
#import "/figures/tables.typ": *

= Requirements
This chapter outlines the requirements for the automated testing framework for Theia Cloud, based on the requirements analysis by Bruegge et al. @bruegge:2004:ObjectorientedSoftwareEngineering.
It begins with an overview of the envisioned solution in @overview, followed by a presentation of several system models in @systemmodels. We will continue with a structured presentation of the proposed system in @proposedsystem, which derives the functional and non-functional requirements from the system models in @functionalrequirements and @nonfunctionalrequirements. Together, these requirements serve as the foundation for the subsequent design, implementation, and evaluation phases.

== Overview <overview>
The primary objective of this thesis is to define, design, and evaluate a system capable of performing automated E2E testing and load testing for an Online Integrated Development Environment. The system aims to provide a reliable and repeatable method for assessing both the functional correctness and performance of the IDE under realistic conditions. By simulating user interactions at scale, it enables the identification of potential bottlenecks, stability issues, and areas for optimization before they impact real users. Furthermore, the system is intended to support continuous evaluation, allowing developers and administrators to maintain high-quality, scalable IDE deployments over time. Overall, the goal is to create a comprehensive testing framework that enhances confidence in the IDE's reliability, responsiveness, and suitability for large-scale educational use.

== System Models <systemmodels>
To better illustrate the requirements and interactions of the proposed system, we present two system models.


=== Analysis Object Model
#TODO[
  I don't know what to do with this, maybe the POM.
]

=== Dynamic Models <dynamicmodels>
To better illustrate the requirements and interactions of the proposed system, we present two dynamic models.

==== Activity Diagram
The activity diagram shown in @fig3 showcases a typical student workflow for a IDE. It starts with the student opening the IDE, potentially changing preferences in the UI and the behavior of the IDE, installing project specific extensions, cloning a repository, editing the code, running the code, and committing and pushing the changes to the remote repository.

#figure(
  image("/figures/activity_ide_use.drawio.svg", height: 70%),
  caption: [Activity Diagram showcasing typical student workflow for the IDEs],
) <fig3>

==== Use Case Model
Focusing on the integration of the IDE with Artemis, we can derive the following use case models showed in @fig4.

#figure(
  image("/figures/usecase_ide.drawio.svg", width: 100%),
  caption: [Use Case for Online IDEs integrated with Artemis],
) <fig4>

Students primarily interact with the IDE to perform programming tasks. Their core use cases include compiling and running code, accessing language server features such as code completion or error highlighting, and submitting code to Artemis for assignments or exams. These use cases reflect typical workflows in computer science courses and emphasize the importance of an IDE that behaves reliably under load, especially in exam settings where hundreds of students may be active simultaneously.

Instructors, on the other hand, rely on the IDE and its integration with Artemis to support teaching activities. Their use cases include ensuring that language tools are available out-of-the-box, without requiring manual setup for different programming languages. They also require secure authentication and session management, both to protect student data and to enforce academic integrity. Furthermore, instructors expect the system to be scalable, capable of supporting many concurrent users without performance degradation, and to be seamlessly connected with exams and exercises hosted on Artemis. These requirements ensure that instructors can confidently use the IDE for both regular coursework and high-stakes assessments.

Together, these use cases highlight the dual perspective of students and instructors and underscore the system's role as a bridge between interactive coding environments and the educational infrastructure provided by Artemis. By analyzing these use cases, we can identify the requirements for the system under test and thereby conclude the functional requirements for the proposed functional testing system.

== Proposed System <proposedsystem>
As there is currently no existing system that can perform automated E2E testing and load testing for an Online Integrated Development Environment IDE, we propose a new system. 

=== Functional Requirements <functionalrequirements>
By assessing the previous system models, we can derive the following functional and non-functional requirements according to the requirements analysis by Bruegge et al. @bruegge:2004:ObjectorientedSoftwareEngineering:

- *FR1. Simulate User Interactions*:
The system must be able to simulate realistic user interactions within the IDE, including opening, editing, and saving files, using the terminal to compile and run programs, managing projects or exercises, and performing version control operations such as committing, pushing, and pulling changes. It must support the execution of sequences of actions that accurately mimic real student workflows.

- *FR2. Automated End-to-End Testing*:
The system must provide automated E2E testing capabilities to verify the correctness of IDE features. It should allow test scenarios to be defined, reused, and parameterized to cover different workflows and use cases, and it must detect errors or failures in core functionality.

- *FR3. Load and Performance Testing*:
The system must also support load and performance testing by simulating multiple concurrent users. It should measure response times, throughput, and error rates under varying levels of load, and it must be capable of reproducing peak usage scenarios, such as those observed during exams or large-scale course sessions.

- *FR4. Monitoring and Reporting*:
During testing, the system must collect relevant performance and behavioral metrics. It should generate detailed reports summarizing test results, errors, and bottlenecks, and provide visualizations or summaries that are easily interpretable by developers and system administrators.

- *FR5. Scenario Management*:
The system must allow test scenarios to be defined, configured, and managed efficiently. This includes the ability to configure user behavior profiles and test parameters, and to enable repeatable execution of scenarios for regression testing and validation of system stability over time.

- *FR6. Integration with Intelligent Agents*:
Optionally, the system should support integration of intelligent agents based on the Model Context Protocol. These agents can simulate adaptive and realistic student behavior, and their behavior should be customizable to represent different skill levels or interaction patterns.


=== Nonfunctional Requirements <nonfunctionalrequirements>
In this section, we list the requirements which are not directly related to the  functionality of the system. We categorize them using the FURPS+ model (Functionality, Usability, Reliability, Performance, Supportability, and Constraints)  described in @bruegge:2004:ObjectorientedSoftwareEngineering:

- *NFR1. Concurrent Test Execution*: <NFR1>
The system must be able to handle high performance requirements, such as the ability to simulate complex workflows and the ability to measure response times, throughput, and error rates under varying levels of load.

- *NFR2. Reproducible Test Results*: <NFR2>
The system must be able to handle high reliability requirements, such as the ability to reproduce test results and the ability to detect errors or failures in core functionality.

- *NFR3. User Behavior Profiles*: <NFR3>
The system must be able to handle high usability requirements, such as the ability to configure user behavior profiles and test parameters, and to enable repeatable execution of scenarios for regression testing and validation of system stability over time.

- *NFR4. Scalable Test Execution*: <NFR4>
The system must be able to handle scalability requirements, such as the ability to simulate multiple concurrent users and the ability to measure response times, throughput, and error rates under varying levels of load.

- *NFR5. Cross-Platform Compatibility*: <NFR5>
The system must be able to handle portability requirements, such as the ability to run on different platforms and the ability to integrate with different systems.

- *NFR6. Data Security*: <NFR6>
The system should ensure that simulated interactions do not compromise user data or access controls in the IDE.

