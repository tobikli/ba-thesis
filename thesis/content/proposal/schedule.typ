#import "../../utils/todo.typ": TODO

= Schedule
The following milestones will guide the implementation process to achieve the outlined objectives. The Bachelor’s thesis starts on _TODO_ and will be completed on _TODO_. To ensure a structured and timely completion of the project, the following schedule is planned:

1. #strong[Iteration (Week 1): Setup Development Environment and Exploration]
   - Setup Playwright Environment
   - Define key user workflows for testing (e.g., code editing, execution, version control)
   - Select test scenarios based on real-world student interactions

2. #strong[Iteration (Weeks 2-4): Implement End-to-End (E2E) UI Testing with Playwright (Objective 4.1)]
   - Implement first E2E tests
   - Simulate user that starts an instance and clones the repository
   - Run initial test executions and validate results

3. #strong[Iteration (Weeks 5-6): Expand Test Coverage & Optimize Test Execution (Objective 4.1 and 4.2)]
   - Implement tests with broader coverage
   - Tests including version control, coding, building, debugging, file management, terminal interaction, and submitting
   - Integrate Playwright Tests into CI/CD Pipeline

4. #strong[Iteration (Weeks 7-9): Develop Scalable Load Testing Framework (Objective 4.2)]
   - Model realistic concurrent user behavior
   - Run initial load tests and identify system limits
   - Run tests in a realistic course size

5. #strong[Iteration (Weeks 10-11): Implement Usage of Randomization and LLMs (Objective 4.1)]
   - Include randomized simulated user interaction and coding
   - Use LLMs to generate even more realistic and wider user interaction

6. #strong[Iteration (Weeks 12-13): Performance Analysis & Bottleneck Identification (Objective 4.3)]
   - Identify bottlenecks and potential areas for optimization
   - Run tests under different system configurations
   - Analyze system metrics (CPU, memory, response times, request throughput)

7. #strong[Iteration (Week 14): Final Evaluation & Refinements]
   - Review the system and check for bugs and errors
   - Validate improvements by running final test cycles
   - Prepare final test reports and documentation