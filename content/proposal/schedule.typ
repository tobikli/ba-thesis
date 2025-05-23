#import "/utils/todo.typ": TODO

= Schedule

The following key milestones structure the implementation timeline of this thesis. Each milestone represents a concrete capability or achievement necessary to reach the final goal of a scalable, reliable testing solution for Theia Cloud within Artemis.

- #strong[Milestone 1 (by 15.06.2025): Functional Integration Tests in Theia IDE]
   
   A developer can run functional integration tests in Theia IDE locally using the Theia IDE Docker image. Furthermore, the tests can be executed directly on the production instance of Theia IDE. The tests  cover the following aspects:
   - Basic functionality of the IDE (e.g., editor, terminal, file navigation)

- #strong[Milestone 2 (by 15.07.2025): Integration into Theia Cloud]
   
   A developer can run functional integration tests on the production and testing server in Theia Cloud. The tests functionally test the landing page and login functionality. Furthermore, integration with Artemis is tested by executing E2E tests in the Artemis repository. The tests cover the following aspects:
   - Basic functionality of the Landing Page (e.g., login, navigation)
   - Basic functionality of the Artemis integration (e.g., submitting exercises, checking results)
   - Testing of multiple Programming Languages (e.g., Java, Python, C) and their respective compilers
   - Testing of building and running of projects

- #strong[Milestone 3 (by 20.08.2025): Load and Scalability Testing]
   
   A developer can run automated (using GitHub Workflows) load and scalability tests in Theia Cloud using Playwright Artillery on the production and testing server. The tests cover the following aspects:
   - Load testing of the IDE with multiple users
   - Scalability testing of the IDE with multiple users
   - Performance testing of the IDE with multiple users

- #strong[Milestone 4 (by 15.09.2025): LLM/MCP Integration (Optional)]
   
   A developer can run randomized, realistic test cases reflecting student behaviors and programming environments. By modeling context dynamically, tests adapt to a wide range of scenarios, including different programming languages and usage patterns. This enables scalable and flexible test generation that better simulates real-world conditions in systems like Theia Cloud.
