#import "/utils/todo.typ": TODO

= Evaluation
#TODO[
  If you did an evaluation / case study, describe it here.
]

== Performance Evaluation
=== Design 
#TODO[
  Performance Evaluation using Grafana and Artillery.io
]

=== Objectives
#TODO[
  Evaluate the performance of the theia under load
]

== Implementation Challenges
Developing a system for automated end-to-end and load testing in the context of an Online IDE involves several unique challenges that extend beyond conventional software testing. Unlike traditional desktop or standalone applications, the Online IDE is provided as a Software-as-a-Service platform, which imposes restrictions on direct system access, lifecycle control, and integration with external tools. These limitations complicate the design of reliable testing workflows, as the testing framework must operate within the boundaries of a managed service environment @tsai:2011:TestingScalabilitySaaS.

Furthermore, the inherent complexity of the system introduces additional difficulties. An Online IDE integrates a multitude of tightly coupled components, including code editors, terminals, language servers, version control systems, and backend evaluation pipelines. Each of these components is highly interactive and stateful, which makes them harder to automate and verify through testing. Ensuring that tests are stable, reproducible, and representative of real user behavior is non-trivial when asynchronous interactions, long-lived sessions, and concurrent usage patterns are involved.

This section discusses the most significant challenges encountered during the implementation. It highlights how the characteristics of the SaaS delivery model and the distributed architecture of the Online IDE influence the testing approach, and how these obstacles were addressed to enable meaningful evaluation of system functionality and performance.

=== Scorpio Testing
One of the goals of this thesis is to also include the Scorpio extension in the workflow of the Artemis integration tests. This is because the Scorpio extension is a crucial part of the Artemis integration and allows the user to interact with Artemis via a browser-based IDE @jandow:2024:ScorpioVisualStudio. Features include the ability to clone repositories, automatically detect already existing repositories, show the exercise description and test result and submit the solution to Artemis.

As Scorpio utilizes Webviews of the Visual Studio Code Extension API #footnote("https://code.visualstudio.com/api/extension-guides/webview") to render custom user interfaces required for the exercise description and test result, it is necessary to capture the webview inside of a `iFrame` #footnote("https://developer.mozilla.org/de/docs/Web/HTML/Reference/Elements/iframe"). 

As every webview runs under a custom subdomain in the `*.webview.` domain space #footnote("https://theia-cloud.io/documentation/addapplication/"), the restrictions of CORS (Cross-Origin Resource Sharing) must be considered. The `iFrame` has the sandbox attribute set to `allow-same-origin` to allow the `iFrame` to access the parent view's resources. Unfortunately, this makes it impossible to access the `iFrame` from the parent view, as the `iFrame` is not part of the same origin.

  ```html
  <iframe sandbox="allow-scripts allow-forms allow-same-origin allow-downloads">
  ```

One of the possible solutions was to dynamically remove the sandbox attribute from the `iFrame` after the `iFrame` has loaded. Due to the nature of removing attributes at runtime, the actual change is not reflected on already loaded pages. #footnote("https://html.spec.whatwg.org/multipage/iframe-embed-object.html#attr-iframe-sandbox")

Removing the CORS restrictions in the browser settings of Playwright also did not achieve the desired result. Therefore, further attempts to include the Scorpio extension in the workflow of the Artemis integration tests were not made, as the priority of this thesis was to develop a testing framework for Theia Cloud.

=== Testing Local And Production System <localtestingchallenges>
To cross-check the functionality of the testing framework, the tests are able to test against the running system as well as against a local system. The local system only includes a single Theia Session running in the local Docker container.

Because of several differences between the local and production system, challenges were encountered when running the same tests against both systems.

These differences include:

- Handling of workspaces: The local system utilizes workspaces in the file system of the local Docker container. Therefore tests can create temporary directories for each workspace to seperate test workflows. The production system does not utilize workspaces in the same way, as the user only has access to the premade workspace in the container under the `/home/project` directory.

- Landing page: As we only utilize a single Theia Session in the local system, there is no need to login or rely on the landing page. This makes it more challinging to differentiate between the test setup of the local system and the production system.

- Different CSS locators: During the development of the testing framework, we noticed that the CSS locators of the production system were not equal to the CSS locators of the local system. This is because the production system utilizes a different version of the Theia IDE and therefore has a different DOM structure. Updating the version of the Theia IDE in the production system solved this issue.

=== Parallel Testing In One Session
The priority of the testing framework is to test a production system running on a cluster with scaling capabilities. As we don't want to start a new instance for each test, we utilize running tests in parallel in one session. 

During development, we noticed that the tests that were running in parallel interfered with each other. Especially the tests that created new files or directories interfered with each other. This is because the tests often created files while another test opened a file using the explorer view, which resulted in the file list being updated and file nodes not being found.

To solve this issue, the tests were refactored to create a temporary workspace for each test file in the root workspace. Tests in a single test file are run sequentially, thereby avoiding the interference of the tests.

=== Running Tests Using A Single Account

Testing the scalability of the system is a crucial part of this thesis. In the production system, we utilize a single account for all tests. Because sessions are binded to user accounts provided by `Keycloak` #footnote("https://www.keycloak.org/"), we are not able to create new users for each test. Therefore, we have to use the same test account for all tests. 
While running the load tests on the cluster, we notices that there is a session limit for each user account. This means that we were not able to run the load tests with more than 10 instances at the same time.

TODO