#import "/utils/todo.typ": TODO
#pagebreak()
= System Design
To present the system design, we will follow the System Design Template presented by Bruegge et al. @bruegge:2004:ObjectorientedSoftwareEngineering. After an Overview of the completete system architecture, we will present the design goals derived from the non-functional requirements in @archoverview. We will continue with presenting the different parts of the test suite, divided into the functional testing architecture in @functionaltesting and the load testing architecture in @loadtesting. Finally, we will present the MCP testing architecture in @mcptesting.

== Overview <archoverview>
The Deployment Diagram in @deploymentdiagramfunctional presents the overall architecture of the testing suite. The test suite is divided into three main components: the functional tests, the load tests, and the MCP tests. The functional tests are responsible for testing the functionality of the system, the load tests are responsible for testing the performance of the system, and the MCP tests are a proof of concept for the usage of LLMs in the test suite. As we run the tests using the Playwright Test Runner, the tests are executed in a headless browser context. The tests are executed in parallel, which is possible due to the usage of the Page Object Model and fixtures, as described in @pageobjectsection. The Test Suite interacts with a LLM using the MCP Interface, as described in @mcptesting. All tests access the Online IDE using the Theia Landing Page and each Theia Client, which on itself is connected to the Theia Operator and each Session running in the K8s Cluster.

#figure(
  image("/figures/proposal/deployment_diagram.svg", width: 100%),
  caption: [Proposed Deployment Diagram for testing suite],
) <deploymentdiagramfunctional>


== Design Goals
We derive the design goals from the non-functional requirements discussed in @nonfunctionalrequirements. The design goals are ordered by their importance and the rationale behind the prioritization.

*1. Scalability:* 
As one of the most important non-functional requirements, scalability is a key design goal. The test suite should be able to handle a large number of tests and users concurrently (NFR4). 

*2. Usability:* 
Usability is a key design goal. The test suite should be easy to use and understand. This is important for the usability of the test suite and the reliability of the test results. Furthermore, the addition of more test cases should be easy and should not require a lot of effort, if new features are added to the system (NFR3).

*3. Reliability:* 
To showcase reasonable and reproducible test results, reliability is a key design goal. The test suite should be able to reproduce the test results and should be able to handle a large number of tests and users concurrently (NFR2). This is important for the performance of the test suite and the reliability of the test results.

*4. Performance:* 
As many tests require a complex workflow, and load tests can reach parallel execution of up to 1000 users, performance is a key design goal. The test suite should be able to handle a large number of tests and users concurrently (NFR1). 

*5. Portability:* 
As the test suite should be able to run in CI/CD pipelines, portability is a key design goal. The test suite should be able to run on different platforms and should be able to integrate with different systems (NFR5).

*6. Security:* 
The test suite should be able to handle data security requirements, as the test suite is used in a CI/CD pipeline (NFR6).

== Functional Testing <functionaltesting>
The functional tests are responsible for testing the functionality of the system. In the following, we will present the workflow of the functional tests, as well as the Page Object Model used in the test suite.

=== Activity Diagram
In the following, we will present the workflow of the functional tests, as seen in @activitydiagramfunctional. First, the test suite logs in to the Landing Page of Theia Cloud and saves the browser state to a file. This is helpful as each test uses a isolated browser context, which is not shared with other tests. After the browser state is saved, the test suite starts a new Theia Instance for all programming languages. This is essential, as we not only test the functionality of each App Image, but we also want to reuse the same instance for multiple tests. Creating a new Theia Instance for each test would be too time-consuming and would stress the system, which is not the purpose of the functional tests. Therefore, the link of each instance is stored in runtime and can be accessed by the fixture as seen in @pomclass.

After all instances are started, the test suite starts the functional tests with the given amount of workers in parallel. As seen in @functional-tests-table, the functional tests are divided into three categories: Editor Tests, Search Tests, Terminal Tests and Version Control Tests. Each category is executed in several separate workers. Furthermore, the tests regarding the programming languages are sequentially executed, as they require the same instance and depend on each other. 

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

Another design pattern used in Playwright Testing is the usage of fixtures to set up the test environment. A fixture is a function that returns a value that can be used in the test. An example of a fixture is the `cApp` fixture, which accesses the Theia Instance which has been started in the setup part of the test workflow. As we saw previously in @activitydiagramfunctional, the test structure first starts a Theia Instance for a specific programming language and the accesses it later through one of the given fixture methods. Each test can then access the instance as a parameter in the test function:

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
As we also want to test the integration with Artemis, we present the sequence diagram in @artemissequence. This is a seperate test project and is not part of the functional tests.
This test is divided into several test steps, which are executed in the given order:
 1. Using the POM from the Artemis Fixture, the Test Runner creates a new course and exercise using the Artemis API running on a Test Server @talibov:2024:ImprovingStabilityWeb. 
 2. After the exercise is created, the Test Runner redirects the user to the Exercise Page and starts the exercise in the Online IDE using the provided Button. The Runner gets redirected to the Theia Landing Page, logs in and automatically starts a new instance.
 3. Due to the parameters passed to the instance, the exercise is automatically cloned and the user can start to solve the exercise.
 4. The test runner opens some of the code templates and edits them.
 5. The test runner commits and pushes the changes to the remote repository.
 6. After the changes are pushed and the build is completed on Artemis, the test runner redirects to the Exercise Page and checks the results.

#figure(
  image("/figures/artemis_sequence.svg", width: 100%),
  caption: [Sequence Diagram of Artemis Integration Test],
) <artemissequence>

== Load Testing <loadtesting>
The load tests are responsible for testing the performance of the system under load. In the following, we will present the architecture of the load tests, as well as the Deployment Diagram used in the test suite. As load tests are typically not part of E2E testing, but rather part of testing APIs under load, we will present a custom load testing architecture native for Playwright, as well as one that utilizes the framework `Artillery.io` @art.

=== Subsystem Decomposition
#TODO[
Subsystem Decomposition
]


=== Deployment Diagram
#TODO[
Das Artillery.io Deployment Diagram.
]
#figure(
  image("/figures/load_architecture.drawio.svg", width: 100%),
  caption: [Deployment Diagram of Load Testing Architecture using Artillery and N instances of a Theia Session],
)

== MCP Testing <mcptesting>

=== Hardware Software Mapping
#TODO[
Beide Subsysteme zeigen (local und remote)
]
#figure(
  image("/figures/mcp_local.drawio.svg", width: 100%),
  caption: [Hardware Software Mapping of MCP running locally],
)

#figure(
  image("/figures/mcp_remote.drawio.svg", width: 100%),
  caption: [Hardware Software Mapping of MCP running in CI/CD],
)


=== Activity Diagram
#TODO[
Beide bzw. wenn nur das komplexe Diagramm
]
#figure(
  image("/figures/activity_mcp_complex.drawio.svg", width: 80%),
  caption: [Activity Diagram of standalone MCP Client Connection],
)