= Evaluation
This thesis contributes to the field of automated testing and performance evaluation of browser-based IDEs by developing a testing framework for Theia Cloud and evaluating its performance under load. Developers and administrators of Theia Cloud and Artemis can especially benefit from this work, as it provides a way to test the functionality and performance of Theia Cloud and Artemis under load.

As several research topics regarding the optimization of the performance of Theia Cloud and Artemis are still ongoing, this thesis does not provide a comprehensive evaluation of the performance of Theia Cloud and Artemis. Instead, it provides a framework for evaluating the performance of Theia Cloud and Artemis under load.

== Implementation Challenges
Developing a system for automated end-to-end and load testing in the context of an Online IDE involves several unique challenges that extend beyond conventional software testing. Unlike traditional desktop or standalone applications, the Online IDE is a Software-as-a-Service platform, which imposes restrictions on direct system access, lifecycle control, and integration with external tools. These limitations complicate the design of reliable testing workflows, as the testing framework must operate within the boundaries of a managed service environment @tsai:2011:TestingScalabilitySaaS.

Furthermore, the inherent complexity of the system introduces additional difficulties. An Online IDE integrates many tightly coupled components, including code editors, terminals, language servers, version control systems, and backend evaluation pipelines. Each component is highly interactive and stateful, making it harder to automate and verify through testing. Ensuring that tests are stable, reproducible, and representative of real user behavior is non-trivial when asynchronous interactions, long-lived sessions, and concurrent usage patterns are involved.

This section discusses the most significant challenges encountered during the implementation. It highlights how the SaaS delivery model's characteristics and the Online IDE's distributed architecture influence the testing approach, and how we addressed these to enable meaningful evaluation of system functionality and performance.

=== Scorpio Testing
One of this thesis's goals is to include the Scorpio extension in the workflow of the Artemis integration tests, because the Scorpio extension is a crucial part of the Artemis integration and allows the user to interact with Artemis via a browser-based IDE @jandow:2024:ScorpioVisualStudio. Features include the ability to clone repositories, automatically detect already existing repositories, show the exercise description and test result, and submit the solution to Artemis.

As Scorpio utilizes Webviews of the Visual Studio Code Extension API #footnote("https://code.visualstudio.com/api/extension-guides/webview") to render custom user interfaces required for the exercise description and test result, it is necessary to capture the webview inside of a `iFrame` #footnote("https://developer.mozilla.org/de/docs/Web/HTML/Reference/Elements/iframe"). 

As every webview runs under a custom subdomain in the `*.webview.` domain space #footnote("https://theia-cloud.io/documentation/addapplication/"), we must consider the restrictions of CORS (Cross-Origin Resource Sharing). The `iFrame` has the sandbox attribute set to `allow-same-origin` to allow the `iFrame` to access the parent view's resources. Unfortunately, this makes it impossible to access the `iFrame` from the parent view, as the `iFrame` is not part of the same origin.

 ```html
 <iframe sandbox="allow-scripts allow-forms allow-same-origin allow-downloads">
 ```

One of the possible solutions was to dynamically remove the sandbox attribute from the `iFrame` after the `iFrame` has loaded. Due to the nature of removing attributes at runtime, the actual change is not reflected on already loaded pages. #footnote("https://html.spec.whatwg.org/multipage/iframe-embed-object.html#attr-iframe-sandbox")

Removing the CORS restrictions in Playwright's browser settings did not achieve the desired result. Therefore, we made no further attempts to include the Scorpio extension in the workflow of the Artemis integration tests, as the priority of this thesis was to develop a testing framework for Theia Cloud.

=== Testing Local And Production System <localtestingchallenges>
To cross-check the functionality of the testing framework, the tests can test against the running system as well as against a local system. The local system only includes a single Theia Session running in a local Docker container.

Because of several differences between the local and production system, we encountered challenges when running the same tests against both systems.

These differences include:

- Handling of workspaces: The local system utilizes workspaces in the file system of the local Docker container. Therefore, tests can create temporary directories for each workspace to separate test workflows. The production system does not utilize workspaces similarly, as the user can only access the pre-made workspace in the container under the `/home/project` directory.

- Landing page: As we only utilize a single Theia Session in the local system, there is no need to log in or rely on the landing page. This differentiation makes it more challenging to distinguish between the test setup of the local system and the production systems' test setup.

- Different CSS locators: During the development of the testing framework, we noticed that the CSS locators of the production system were not equal to the CSS locators of the local system. That is because the production system utilizes a different version of the Theia IDE and has a different DOM structure. Updating the version of the Theia IDE in the production system solved this issue.

=== Parallel Testing In One Session
The priority of the testing framework is to test a production system running on a cluster with scaling capabilities. As we do not want to start a new instance for each test, we run tests in parallel in one session. 

During development, we noticed that the tests running in parallel interfered with each other. The tests that created new files or directories interfered with each other because they often created files simultaneously when another test opened a file using the explorer view, which resulted in the IDE updating the file list. Therefore, the tests could not find the corresponding file nodes.

To solve this issue, we refactored the tests to create a temporary workspace for each test file in the root workspace. Tests in a single test file run sequentially, avoiding interference from the other tests.

=== Running Tests Using A Single Account

Testing the scalability of the system is a crucial part of this thesis. In the production system, we utilize a single account for all tests. We cannot create new users for each test because sessions are bound to user accounts provided by `Keycloak` #footnote("https://www.keycloak.org/"). Therefore, we have to use the same test account for all tests. 
While running the load tests on the cluster, we noticed a session limit for each user account. Therefore, we were not able to run the load tests with more than 10 instances at the same time.


== Test Infrastructure and Execution Strategy Limitations

The developed test suite relies on two separate testing environments: the Artemis Test Server and a dedicated Test Server for Theia Cloud. These environments provide the necessary backend and frontend infrastructure to execute automated end-to-end and load testing scenarios under realistic conditions.

=== Integration Limitations in the Artemis E2E Pipeline

During implementation, it was not feasible to integrate the Theia-related tests directly into the Artemis end-to-end testing pipeline. The primary reason for this limitation is that the Artemis testing environment operates in an isolated context, without access to external services not deployed within the same containerized setup. Since Theia Cloud is managed and deployed independently, we could not establish direct communication between Artemis and Theia within the pipeline.

An additional constraint arises from deploying an extra Theia instance inside the Artemis CI environment, requiring significant resources and configuration overhead. This setup would complicate the testing workflow and increase the maintenance burden, without substantial benefit for the current development focus. Therefore, this approach was deemed infeasible.

=== Use of External Test Servers

As a result, all tests requiring integration between Artemis and Theia Cloud run against the respective systems' externally deployed or self-hosted instances. We thus configured the test suite to connect to one of the available Artemis test servers and the designated Theia Cloud test server. This setup mirrors the production environment and ensures that tests validate realistic system behavior, including network latency, service communication, and authentication processes.

=== Pipeline Execution and Manual Testing

Due to the nature of the load tests, we intentionally decided not to run them automatically in the CI/CD pipeline. Load tests can generate high system utilization and may interfere with ongoing development or active system usage. Instead, developers execute such tests manually when evaluating performance or verifying changes that may impact scalability.

We are not significantly modifying client-facing features or the user interface at the project's current stage. Therefore, performing manual validation combined with targeted redeployments provides a more efficient and controlled testing workflow than running automated tests on every pull request.

=== MCP Testing Status

Model Context Protocol-based testing integration is still experimental and not yet included in the automated test pipelines. The current MCP implementation requires connectivity to Anthropic's Claude #footnote("https://www.anthropic.com/") models and other specialized infrastructure components unavailable in the cloud-based testing environment. Consequently, automated execution and continuous deployment of these tests are not yet possible. Future work will focus on stabilizing the MCP testing components and integrating them into a dedicated pipeline once the necessary infrastructure becomes available.