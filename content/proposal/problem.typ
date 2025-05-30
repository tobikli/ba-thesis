#import "/utils/todo.typ": TODO

= Problem
Theia Cloud is crucial in enabling students to write and execute code directly within the browser as part of their coursework in Artemis. However, ensuring a smooth and responsive user experience remains challenging, particularly as the number of students relying on the platform increases @tiz. Despite its capabilities, Theia Cloud lacks comprehensive automated testing and performance evaluation, leading to potential usability and scalability issues.

A key issue is the lack of automated End-to-End (E2E) testing to verify Theia Cloud's interactive features @paul:2001:EndtoendIntegrationTesting. Students frequently use functionalities such as code editing, file management, terminal access, and version control integration, all of which require a seamless user experience. However, regressions and UI inconsistencies may go unnoticed without proper automated testing, leading to unexpected failures during assignments or exams. Since developers actively maintain Theia Cloud, manual testing is impractical, leaving gaps in ensuring feature stability.

In addition to functional issues, Theia Cloud's performance under load remains largely untested. Hundreds of students access the system simultaneously during programming exams and high-traffic periods, executing programs, modifying files, and interacting with the terminal. The lack of scalability testing means bottlenecks and system failures may only become apparent under real-world conditions, potentially leading to slow response times, unresponsive interfaces, or crashes. Such failures directly impact students, who cannot complete their assignments, and instructors, who must deal with technical disruptions.

Furthermore, there is limited visibility into performance bottlenecks, making it difficult for system administrators to proactively address issues. While monitoring tools like Grafana #footnote("https://grafana.gchq.ase.in.tum.de/") provide insights into system metrics, without structured load testing, it is challenging to determine at what point the system fails to scale or which components are most susceptible to performance degradation.

The lack of structured, automated testing and scalability assessment poses a risk to the reliability, usability, and stability of Theia Cloud within Artemis. 
