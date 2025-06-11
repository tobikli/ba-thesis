#import "/utils/todo.typ": TODO

= Problem
Theia Cloud enables students to write and execute code directly in the browser as part of their coursework in Artemis. However, its reliability and responsiveness under growing user demand remain uncertain. Without systematic testing and performance evaluation, the platform may exhibit issues that affect usability and learning outcomes.

A key issue is the lack of automated end-to-end (E2E) testing to verify Theia Cloud's interactive features @paul:2001:EndtoendIntegrationTesting. Students frequently use functionalities such as code editing, file management, terminal access, and version control integration, all of which require a seamless user experience. However, regressions and UI inconsistencies may go unnoticed without proper automated testing, leading to unexpected failures during assignments or exams. Since developers actively maintain Theia Cloud, manual testing is impractical, leaving gaps in ensuring feature stability.

Additionally, Theia Cloud's scalability has not been systematically evaluated. During programming exams, hundreds of students interact with the system concurrently. Without structured load testing, bottlenecks and system failures may only surface under real-world conditions, causing slow responses or crashes. These failures disrupt student workflows and burden instructors with technical issues.

There is limited visibility into performance bottlenecks, which makes it difficult for system administrators to address issues proactively. Although monitoring tools like Grafana #footnote("https://grafana.gchq.ase.in.tum.de/") offer insights into system metrics, without structured load testing it remains unclear when the system fails to scale or which components are most vulnerable to performance degradation.