#import "/utils/todo.typ": TODO

= Introduction
Cloud-based Integrated Development Environments (IDEs) have transformed how software is developed, taught, and delivered. Starting with traditional desktop IDEs such as Eclipse #footnote("https://eclipseide.org/") or IntelliJ Idea #footnote("https://www.jetbrains.com/idea/"), the field has evolved toward fully browser-based environments that eliminate the need for local setup. These platforms, including Gitpod, VSCode, and Theia, are especially useful in education, where ease of access, standardization, and scalability are critical.
Theia Cloud, an open-source extensible IDE framework, is used at the Technical University of Munich (TUM) in conjunction with Artemis, a learning platform that supports programming exercises with automatic assessment @krusche:2018:ArTEMiSAutomaticAssessment. In this setup, students can directly write, test, and submit their code in the browser using a dedicated Theia instance and a custom extension @jandow:2024:ScorpioVisualStudio. While this integration simplifies educational workflows, it also introduces technical complexity, especially regarding automated testing and scalability under real-world load.

== Problem
Despite its advantages, the current Theia Cloud integration lacks systematic automated testing and performance evaluation. There is no E2E test suite to verify that core functionalities such as file editing, terminal usage, or version control behave correctly from a user perspective. This leads to potential regressions and UI inconsistencies going undetected @paul:2001:EndtoendIntegrationTesting.
Furthermore, Theia Cloud has not been tested at scale. During high-demand periods, such as programming exams, hundreds of students interact with the system simultaneously. Without realistic load testing, the system may suffer from slow response times, instability, or failures, affecting the user experience and the reliability of educational assessments. Existing monitoring tools like Grafana #footnote("https://grafana.com/") provide runtime insights but do not simulate student behavior or identify failure points under load.

== Motivation
The reliability and scalability of browser-based IDEs are critical to modern programming education. Students rely on seamless access to development tools, especially during assessments, where interruptions can lead to frustration or unfair grading. A responsive and stable IDE directly impacts learning outcomes and student satisfaction @hundhausen:2017:IDEBasedLearningAnalytics. 
Instructors also benefit from a trustworthy system, as it reduces disruptions during teaching and allows for more complex assignments without worrying about platform limitations. From a scientific standpoint, testing interactive web applications like IDEs remains a challenging problem, especially in the context of cloud-native applications regarding scalability and performance @tsai:2011:TestingScalabilitySaaS. By addressing functional correctness and load behavior in a unified framework, this thesis contributes to research in end-to-end testing, performance engineering, and cloud-native education infrastructure.

== Objectives
This thesis aims to ensure the reliability, usability, and scalability of Theia Cloud within Artemis by developing a structured, automated testing framework. This involves both E2E UI testing and scalability testing, enabling the identification of performance bottlenecks under real-world conditions @paul:2001:EndtoendIntegrationTesting. The key objectives of this thesis are:
#set heading(numbering: none)
===	Develop an automated Theia E2E testing suite
To ensure the correctness and stability of Theia Cloud's interactive features, this thesis develops an automated E2E test suite using Playwright #footnote("https://playwright.dev/")<pwr>. The tests cover essential functionalities, including code editing, file management, terminal interactions, and version control integration.

===	Implement a scalable load testing framework
To evaluate Theia Cloud's performance under high demand, this thesis implements a scalable load testing framework using Artillery #footnote("https://artillery.io/")<art>. The tests simulate realistic user behavior, including concurrent file operations, terminal interactions, and version control operations.

===	Analyze system performance and identify bottlenecks
This thesis analyzes the performance of Theia Cloud under load, identifying bottlenecks in the system's response time and resource utilization.

===	Create randomized and personalized tests using LLMs
The scalable load testing framework should be able to generate randomized and personalized tests using LLMs to ensure the test suite is comprehensive and effective.

#set heading(numbering: "1.1")

== Outline
The thesis will be structured as follows:

#TODO[
  Describe the outline of your thesis
]

== Objectives
#TODO[
  Describe the research goals and/or research questions and how you address them by summarizing what you want to achieve in your thesis, e.g. developing a system and then evaluating it.
]

== Outline
#TODO[
  Describe the outline of your thesis
]