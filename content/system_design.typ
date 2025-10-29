#import "/utils/todo.typ": TODO
#pagebreak()
= System Design
To present the system design, we will follow the System Design Template presented by Bruegge et al. @bruegge:2004:ObjectorientedSoftwareEngineering. After an Overview of the complete system architecture, we will present the design goals derived from the non-functional requirements in @archoverview. We will continue presenting the different parts of the test suite, divided into the functional testing architecture in @functionaltesting and the load testing architecture in @loadtesting. Finally, we will present the MCP testing architecture in @mcptesting.

== Overview <archoverview>
The Deployment Diagram in @deploymentdiagramfunctional presents the overall architecture of the testing suite. We divided the test suite into three main components: the functional tests, the load tests, and the MCP tests. The functional tests are responsible for testing the system's functionality, the load tests are responsible for testing the system's performance, and the MCP tests are a proof of concept for using LLMs in the test suite. As we run the tests using the Playwright Test Runner, we can execute the test environment in a headless browser context. Furthermore, the tests are executed in parallel, which is possible due to the usage of the Page Object Model and fixtures, as described in @pageobjectsection. The Test Suite interacts with an LLM using the MCP Interface, as described in @mcptesting. All tests access the Online IDE using the Theia Landing Page and each Theia Client, which connects to the Theia Operator and each Session running in the K8s Cluster.

#figure(
  image("/figures/proposal/deployment_diagram.svg", width: 100%),
  caption: [Proposed Deployment Diagram for testing suite],
) <deploymentdiagramfunctional>


== Design Goals
We derive the design goals from the non-functional requirements discussed in @nonfunctionalrequirements, ordered by their importance and the rationale behind the prioritization.

*1. Scalability:* 
As one of the most important non-functional requirements, scalability is a key design goal. The test suite should be able to handle many tests and users concurrently (NFR4). 

*2. Usability:* 
Usability is a key design goal. The test suite should be easy to use and understand, which is important for the usability of the test suite and the reliability of the test results. Furthermore, adding more test cases should be easy and not require much effort if the developers add new features to the system (NFR3).

*3. Reliability:* 
Reliability is a key design goal to showcase reasonable and reproducible test results. The test suite should be able to reproduce the test results and should be able to handle a large number of tests and users concurrently (NFR2). This is important for the test suite's performance and the test results' reliability.

*4. Performance:* 
As many tests require a complex workflow, and load tests can reach parallel execution of up to 1000 users, performance is a key design goal. The test suite should be able to handle many tests and users concurrently (NFR1). 

*5. Portability:* 
As the test suite should be able to run in CI/CD pipelines, portability is a key design goal. The test suite should be able to run on different platforms and integrate with different systems (NFR5).

*6. Security:* 
The test suite should be able to handle data security requirements, as we use the test suite in a CI/CD pipeline (NFR6).

== Functional Testing <functionaltesting>
The functional tests are responsible for testing the functionality of the system. In the following, we will present the workflow of the functional tests, as well as the Page Object Model used in the test suite.

=== Activity Diagram
In the following, we will present the workflow of the functional tests, as seen in @activitydiagramfunctional. First, the test suite logs in to the Landing Page of Theia Cloud and saves the browser state to a file. This is helpful as each test uses an isolated browser context, which we do not share with other tests. After saving the browser state, the test suite starts a new Theia Instance for all programming languages, as we not only test the functionality of each App Image, but we also want to reuse the same instance for multiple tests. Creating a new Theia Instance for each test would be too time-consuming and would stress the system, which is not the purpose of the functional tests. Therefore, the link of each instance is stored in the runtime and can be accessed by the fixture as seen in @pomclass.

After the instances finish loading, the test suite starts the functional tests with the given number of workers in parallel. As seen in @functional-tests-table, we divide the functional tests into three categories: Editor Tests, Search Tests, Terminal Tests, and Version Control Tests. Several separate workers execute each category. Furthermore, the tests regarding the programming languages execute sequentially, as they require the same instance and depend on each other. 

After all workers have finished, the test suite logs out of the Landing Page and deletes the browser state file.
#figure(
  image("/figures/activity_complex_workflow.drawio.svg", height: 70%),
  caption: [Activity Diagram of functional tests workflow],
) <activitydiagramfunctional>

=== Page Object Model <pageobjectsection>
Sophisticated Playwright Testing often uses the Page Object Model (POM) to structure the test code @krasnokutska:2023:ImplementingE2ETests. It is a design pattern that separates the representation of the page from the test logic, making the code more maintainable and reusable. A Page Object Model is a class that represents a page in the application. It contains the locators for the elements on the page and the methods to interact with them. An example of a method is the `launchLanguage` method, which starts a new Theia Instance for a specific programming language from the Landing Page:

```typescript
 async launchLanguage(language: string) {
    const languageButton = await this.page
 .getByRole("button", { name: `Launch ${language}` })
 .first();
    await languageButton.click();
 }
```

To illustrate the Page Object Model used in the test suite, we present the class diagram in @pomclass.
#figure(
  image("/figures/pom_class.svg", width: 100%),
  caption: [Class Diagram for Playwright Page Object Model],
) <pomclass>

Another design pattern used in Playwright Testing is the usage of fixtures to set up the test environment. A fixture is a function that returns a value that we can use in the test. An example of a fixture is the `cApp` fixture, which accesses the Theia Instance that we started in the setup part of the test workflow. As we previously saw in @activitydiagramfunctional, the test structure starts a Theia Instance for a specific programming language and accesses it later through one of the given fixture methods. Each test can then access the instance as a parameter in the test function:

```typescript
test("Compile C file", async ({ cApp }) => {
  const terminal = await cApp.theiaApp.openTerminal(TheiaTerminal);
  await terminal.submit(`gcc -o ${fileName}.out ${fileName}`);
  const explorer = await cApp.theiaApp.openView(TheiaExplorerView);
  await explorer.waitForVisible();
  await expect(
    await explorer.existsFileNode(`${fileName}.out`)
 ).toBeTruthy();
});
```



=== Sequence Diagram
As we also want to test the integration with Artemis, we present the sequence diagram in @artemissequence. This is a separate test project, not part of the functional tests.
We divide this test into several test steps, which execute in the given order:
 1. Using the POM from the Artemis Fixture, the Test Runner creates a new course and exercise using the Artemis API running on a Test Server @talibov:2024:ImprovingStabilityWeb. 
 2. After creating the exercise, the Test Runner redirects the user to the Exercise Page and starts the exercise in the Online IDE using the provided Button. The Runner gets redirected to the Theia Landing Page, logs in, and automatically starts a new instance.
 3. Because the instance receives specific parameters, it automatically clones the exercise, allowing the user to start solving it.
 4. The test runner opens and edits some of the code templates.
 5. The test runner commits and pushes the changes to the remote repository.
 6. After the user pushes the changes and Artemis completes the build, the test runner redirects to the Exercise Page and checks the results.

#figure(
  image("/figures/artemis_sequence.svg", width: 100%),
  caption: [Sequence Diagram of Artemis Integration Test],
) <artemissequence>

== Load Testing <loadtesting>
The load tests are responsible for testing the system's performance under load. In the following, we will present the architecture of the load tests and the Deployment Diagram used in the test suite. As load tests are typically not part of E2E testing, but rather part of testing APIs under load, we will present a custom load testing architecture native for Playwright and one that utilizes the framework `Artillery.io` @art.

=== Load Testing Architecture
One approach to running load tests using Playwright is using the `Artillery.io` framework @art. This framework is a tool for running load tests using a simple YAML configuration file or a JavaScript file. The deployment diagram in @loadarchitecture shows the architecture of the load tests using the `Artillery.io` framework. The `Artillery.io` framework utilizes Playwright as the engine to run a function on each runner. Each runner uses a separate instance of the Theia Session running in the K8s Cluster. The `Artillery.io` framework is responsible for scaling the number of runners to the given number of instances. Running tests are divided into phases, each with two specific parameters: the duration of the phase and the arrival rate. These parameters let us control load testing by defining how frequently the system creates new runners and how long they run.

Every runner runs the predefined function `virtualStudent`, which defines the workflow of the virtual student. After setting up the IDE environment, the runner randomly selects a scenario from the predefined list in @scenarios and executes the workflow until the phase finishes.

#figure(
  image("/figures/load_architecture.drawio.svg", width: 100%),
  caption: [Deployment Diagram of Load Testing Architecture using Artillery and N instances of a Theia Session],
) <loadarchitecture>

As seen in @loadarchitecture, the Artillery Runner runs in the Playwright Executor, and spins up 1..N new runners, which are then each accessing the single Theia Landing Page and one of the N Theia Instance Clients running in the Headless Browser Environment. These components access the Theia Operator and Theia Session API running in the K8s Cluster, similar to the proposed architecture in @deploymentdiagramfunctional.


== MCP Testing <mcptesting>

Model Context Protocol is a tool for interacting with LLMs with context. By leveraging the MCP, this thesis also explores the possibility of generating tests that adapt to individual user profiles, preferences, and learning styles. This approach aims to enhance the realism and relevance of the testing scenarios, making them more representative of actual user interactions. As MCP is already an established protocol, we divided the MCP testing into two parts: the MCP Client running locally on one of the supported IDEs and a custom MCP Client that could run in the CI/CD pipeline.

=== Local MCP Client
The most common way to set up a Model Context Protocol (MCP) environment is to run the server component either inside a Docker container or as a separate process launched by the client application. Modern integrated development environments such as Theia, Visual Studio Code, and Cursor already include native support for this protocol. The IDE can establish a connection between the server and a large language model by providing the prebuilt Playwright MCP server #footnote("https://github.com/microsoft/playwright-mcp") to the client.

As seen in @mcplocal, the IDE acts as the MCP client and coordinates the Playwright MCP server and the LLM agent. Depending on the IDE's setup, the client connects to a remotely hosted LLM, enabling bidirectional communication between the two components. The client uses the MCP interface to give the server controlled access to the LLM's capabilities.

Whenever the language model needs to interact with the MCP server, it sends a message through the client, which forwards it accordingly. The server can execute Playwright commands based on the received instructions, such as navigating to a page, clicking on elements, or performing input actions. Meanwhile, the IDE forwards user inputs to the client, which converts them into context for the LLM, allowing it to generate appropriate prompts for testing and interacting with the system.

#figure(
  image("/figures/mcp_local.drawio.svg", width: 100%),
  caption: [Hardware Software Mapping of MCP running locally],
) <mcplocal>

=== Remote MCP Client
As we potentially do not want to depend on a specific IDE, we also explore the possibility of running a custom MCP Client, which we can use in the CI/CD pipeline. As seen in @mcpremote, we first manually start the MCP Server and then start a custom MCP Client, which connects to the MCP Server using the MCP Interface and the LLM Server using the appropriate API. The custom MCP Client then automatically sends the predefined prompt to the LLM and waits for the response. The system then passes the response to the MCP Server, which executes the Playwright Commands, such as navigating to a specific page or clicking on a specific element.

#figure(
  image("/figures/mcp_remote.drawio.svg", width: 100%),
  caption: [Hardware Software Mapping of MCP running in CI/CD],
) <mcpremote>

==== Activity Diagram
To further illustrate the workflow of the MCP Client, we present the activity diagram in @activitymcpcomplex.

#figure(
  image("/figures/activity_mcp_complex.drawio.svg", width: 80%),
  caption: [Activity Diagram of standalone MCP Client Connection],
) <activitymcpcomplex>

As seen in @activitymcpcomplex, we individually start the LLM, the MCP Client, and the Playwright MCP Server. The MCP Server initiates the Playwright Browser and waits for the MCP Client to connect. The MCP Client then connects to the MCP Server and sends the Toolkit provided by the MCP Server and the Prompt to the LLM. The LLM then resolves the MCP Commands and sends a message to the MCP Client, which then sends the message to the MCP Server. The MCP Server then executes the Playwright Commands, such as navigating to a specific page or clicking on a specific element. The MCP Server returns the result to the MCP Client, which then returns the result to the LLM. The LLM then analyzes the result and either returns the result to the MCP Client or further commands to the MCP Server.