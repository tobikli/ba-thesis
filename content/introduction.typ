#import "/utils/todo.typ": TODO

= Introduction

Cloud-based Integrated Development Environments (IDEs) have transformed how we develop, teach, and deliver software. Starting with traditional desktop IDEs such as Eclipse #footnote("https://eclipseide.org/") or IntelliJ IDEA #footnote("https://www.jetbrains.com/idea/"), the field has evolved toward fully browser-based environments that eliminate the need for local setup. Advances in web technologies, containerization, and cloud computing, which make it possible to provide standardized and instantly accessible development environments at scale, have driven this evolution. Platforms such as Gitpod, VS Code for the Web, and Theia #footnote("https://theia-cloud.io/") exemplify this trend. They are particularly relevant in education, where reducing technical barriers for students and ensuring consistency across heterogeneous hardware and operating systems is of central importance.

Theia Cloud, an open-source extensible IDE framework, is deployed at the Technical University of Munich (TUM) in conjunction with Artemis #footnote("https://artemis.tum.de/"), a learning platform that supports programming exercises with automatic assessment @krusche:2018:ArtemisAutomaticAssessment. Within this setup, Theia Cloud is connected to Artemis through a dedicated OpenVSX extension @jandow:2024:ScorpioVisualStudio and launched via a custom integration, which provisions a dedicated Theia instance for each student @schmidt:2024:InclusiveLearningEnvironments. This design enables a seamless workflow where students can directly solve programming tasks, test their code, and submit their solutions within the same environment. From a pedagogical perspective, such integration reduces friction, shortens setup times, and allows instructors to focus on learning objectives rather than technical support.

However, the integration also introduces significant technical challenges. Unlike traditional single-user IDEs, Theia Cloud must reliably serve hundreds of concurrent users in scenarios such as programming exams, where time pressure and robustness are crucial. Performance degradations, high latency, or failures in launching IDE instances can disrupt exams and negatively affect the fairness and reliability of assessments. Beyond exams, scalability and stability are equally critical for large courses in self-study and homework contexts, where the platform must remain responsive under sustained load.

== Problem

Despite its advantages, the current Theia Cloud integration lacks systematic automated testing and performance evaluation. At present, there is no comprehensive end-to-end (E2E) test suite to verify that core functionalities, such as file editing, terminal usage, code execution, and version control, work reliably from the perspective of a student or instructor. This gap increases the risk that regressions, UI inconsistencies, or broken features remain undetected until they cause disruptions during real usage scenarios @paul:2001:EndtoendIntegrationTesting. Manual testing is insufficient to guarantee stability, as Theia Cloud is under active development and frequent updates can unintentionally introduce new issues.

In addition to functional reliability, scalability represents another unresolved challenge. Theia Cloud has not undergone systematic testing under realistic high-load conditions. Hundreds of students may access the system concurrently during programming courses and exams, performing tasks such as compiling, running, and submitting code. Although research regarding creating a more resource-light and easy-to-set-up environment for Theia Cloud has been conducted @jandow:2025:DesktopWebDevelopmenta, without structured load testing, the system may exhibit degraded performance, including slow response times, unresponsive interfaces, or even complete service failures. Such problems directly impact students, who rely on the IDE to complete assignments or exams within strict time limits, and may lead to unnecessary stress and frustration @stowell:2010:EffectsOnlineTesting, as well as instructors, who must deal with interruptions and technical failures.

Although monitoring tools such as Grafana #footnote("https://grafana.com/") provide valuable runtime insights into metrics like CPU, memory, and request throughput, they are insufficient for identifying where and when the system breaks under stress @lucas:1971:PerformanceEvaluationMonitoring. Monitoring shows symptoms, but does not reproduce the dynamic and unpredictable behavior of actual users. As a result, critical bottlenecks and scalability limitations often only become visible during live usage, when it is too late to mitigate them effectively. This lack of systematic, automated testing, both at the functional and performance levels, represents a significant obstacle to ensuring the reliability, usability, and scalability of Theia Cloud in educational settings.

== Motivation

The reliability and scalability of browser-based IDEs are critical to modern programming education. Students rely on seamless access to development tools as seen in @fig1, especially during assessments, where interruptions can lead to frustration, lost time, or unfair grading outcomes. A responsive and stable IDE directly influences learning success and overall student satisfaction @hundhausen:2017:IDEBasedLearningAnalytics. In high-stakes settings such as exams, even short outages or delays can undermine trust in the system and compromise the validity of the evaluation process.

#figure(
  image("/figures/theia-example.png", width: 100%),
  caption: [Example View for a student during a programming exam using Theia Cloud],
) <fig1>


Ensuring such reliability requires more than just stable infrastructure; it depends on a deep understanding of how students and instructors interact with the IDE in real educational contexts. Examining their respective needs and expectations makes it clear why system robustness and scalability are not merely technical goals but essential prerequisites for effective teaching and learning.
The following will examine how different target groups may benefit from a stable infrastructure and a reliable testing system.


=== Instructors And Students
For instructors and educational institutions, a robust IDE infrastructure enables the creation of richer and more complex exercises without being limited by technical uncertainties. When instructors can assume a stable baseline for the environment, they can design tasks that emphasize problem-solving, algorithmic thinking, and creativity rather than troubleshooting setup issues. This shift allows more focus on pedagogy while reducing the support burden during courses and exams.

=== Operational Perspective
From an operational perspective, universities must simultaneously serve large cohorts of students, often under strict time constraints. Without systematic scalability testing, institutions risk performance bottlenecks and failures that can jeopardize entire examinations. Therefore, automated verification and realistic load simulations are essential to quality assurance in digital learning environments. 

=== Scientific Perspective
From a scientific standpoint, testing interactive web applications such as cloud-based IDEs remains a challenging and underexplored problem @marin:2011:TestingFutureWeb. End-to-end testing approaches must account for asynchronous user interactions, real-time feedback, and integration with external services. Furthermore, scalability testing in cloud-native education infrastructure introduces unique challenges: hundreds of parallel user sessions, varying network conditions, and the need to reproduce realistic student workflows. Existing research on Software-as-a-Service (SaaS) testing and performance engineering @tsai:2011:TestingScalabilitySaaS provides valuable foundations, but the educational use case introduces distinct requirements regarding fairness, reliability, and usability.

By addressing both functional correctness and load behavior in a unified framework, this thesis contributes to ongoing research in end-to-end testing, performance engineering, and educational technology. The results enhance Theia Cloud's reliability within Artemis and provide transferable insights for designing and testing other cloud-based educational systems. 


== Objectives
This thesis aims to ensure the reliability, usability, and scalability of Theia Cloud within Artemis by developing a structured, automated testing framework. This involves both E2E UI and scalability testing, enabling the identification of performance bottlenecks under real-world conditions @paul:2001:EndtoendIntegrationTesting. The key objectives of this thesis are:
#set heading(numbering: none)
=== Develop an automated Theia E2E testing suite
To ensure the correctness and stability of Theia Cloud's interactive features, this thesis develops an automated E2E test suite.
The basic structure of the test suite, as seen in @fig2, covers essential functionalities, including code editing, file management, terminal interactions, and version control integration.

#figure(
  image("/figures/activity_basic_workflow.drawio.svg", height: 45%),
  caption: [Basic Activity Diagram of a functional test workflow],
) <fig2>


=== Implement A Scalable Load Testing Framework
To evaluate Theia Cloud's performance under high demand, this thesis implements a scalable load testing framework using Artillery #footnote("https://artillery.io/")<art>. The tests simulate realistic user behavior, including concurrent file operations, terminal interactions, and version control operations.

=== Analyze System Performance And Identify Bottlenecks
This thesis analyzes the performance of Theia Cloud under load, identifying bottlenecks in the system's response time and resource utilization. The goal is to comprehensively evaluate Theia Cloud's scalability limits, helping system administrators and developers make informed decisions about optimizations and infrastructure scaling.

=== Create Randomized And Personalized Tests Using LLMs
The scalable load testing framework should be able to generate randomized and personalized tests using LLMs to ensure the test suite is comprehensive and practical. It uses the MCP (Model Context Protocol) #footnote("https://modelcontextprotocol.io/")<mcp> to create diverse test cases covering various programming languages, IDE features, and user behaviors. Therefore, we can evaluate Theia Cloud’s capabilities and performance under different conditions more comprehensively. 

#set heading(numbering: "1.1")

== Outline
This thesis is organized into seven chapters as follows: \

  *Chapter 1 Introduction*
presents the research problem and introduces the existing system, its architecture, and the motivation for building an automated E2E and load testing framework. \

  *Chapter 2 Related Work*
reviews existing approaches and research in automated testing, performance evaluation, and educational IDEs. \
  *Chapter 3 Requirements Analysis*

identifies and analyzes the functional and non-functional requirements for testing Theia Cloud. \
  *Chapter 4 System Design*

describes the architecture and implementation of the proposed testing framework, including E2E and load testing strategies. \
  *Chapter 5 Test Results*

discusses the results, challenges and limitations of the testing suite. \
  *Chapter 6 Summary*

summarizes the findings and outlines directions for future research. \