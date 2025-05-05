#import "/utils/todo.typ": TODO

= Schedule

The following key milestones structure the implementation timeline of this thesis. Each milestone represents a concrete capability or achievement necessary to reach the final goal of a scalable, reliable testing solution for Theia Cloud within Artemis.

- #strong[Milestone 1 (by 31.05.2025): Functional Integration Tests in Theia IDE]
   
   A developer can run functional integration tests in Theia IDE locally using the Theia IDE Docker image. Furthermore, the tests can be executed directly on the production instance of Theia IDE. The tests are designed to cover the following aspects:
   - Basic functionality of the IDE (e.g., editor, terminal, file navigation)

- #strong[Milestone 2 (by 14.07.2025): Integration into Theia Cloud]
   
   A developer can run functional integration tests in Theia Cloud on the production and testing server. The Landing Page and login functionality can be functionally tested. Furthermore, integration with Artemis can be tested by executing E2E tests in the Artemis repository. The tests are designed to cover the following aspects:
   - Basic functionality of the Landing Page (e.g. login, navigation)
   - Basic functionality of the Artemis integration (e.g. submitting exercises, checking results)
   - Testing of multiple Programming Languages (e.g. Java, Python, C) and their respective compilers
   - Testing of building and running of projects

- #strong[Milestone 3 (by 14.08.2025): Load and Scalability Testing]
   
   A developer can run automated (using GitHub Workflows) load and scalability tests in Theia Cloud using Playwright Artillery on the production and testing server. The tests are designed to cover the following aspects:
   - Load testing of the IDE with multiple users
   - Scalability testing of the IDE with multiple users
   - Performance testing of the IDE with multiple users

- #strong[Milestone 4 (by 31.08.2025): LLM/MCP Integration (Optional)]
   
   A developer can run randomized and realistic test cases that reflect various student behaviors and programming environments. By modeling context dynamically, tests can be adapted to a wide range of scenarios, including different programming languages and usage patterns. This enables scalable and flexible test generation that better simulates real-world conditions in systems like Theia Cloud.
