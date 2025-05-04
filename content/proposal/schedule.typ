#import "/utils/todo.typ": TODO

= Schedule

The following key milestones structure the implementation timeline of this thesis. Each milestone represents a concrete capability or achievement necessary to reach the final goal of a scalable, reliable testing solution for Theia Cloud within Artemis.

- #strong[Milestone 1 (by 31.05.2025): Functional Integration Tests within Artemis]
   - Automated tests can launch Theia Cloud via the "Open Online IDE" button in Artemis
   - Tests simulate realistic user interactions:
     - Accessing courses and programming exercises
     - Opening the IDE, cloning repositories
     - Modifying code and submitting solutions
   - Test validations include confirmation of feedback and grading via Artemis UI or API
   - Ensures system correctness from a user's point of view

- #strong[Milestone 2 (by 30.06.2025): Scalable Load Testing Framework Operational]
   - Realistic user behavior is modeled and simulated across multiple concurrent users
   - Test scenarios include:
     - Code editing, terminal usage, file navigation, submissions, version control
   - Load tests can simulate full-course usage (e.g., 100+ concurrent users)
   - System metrics such as CPU, memory, response times, and error rates are collected and visualized (e.g., via Grafana)

- #strong[Milestone 3 (by 31.07.2025): AI-Enhanced Test Variants and Randomization]
   - Integration of AI-generated user personas (e.g., via LLMs) to vary coding styles and behaviors
   - Randomized execution paths simulate more diverse student interactions
   - A configurable engine generates test users with variable expertise, input behavior, and task execution patterns
   - Ensures broader test coverage and stress on edge cases

- #strong[Milestone 4 (by 31.08.2025): Performance Evaluation and Final Validation]
   - Comprehensive analysis of test results and system metrics under peak and nominal load
   - Identification of bottlenecks and regressions
   - Final report includes system strengths, weaknesses, and recommendations
   - All code and documentation finalized and prepared for submission

The Bachelor’s thesis starts on _TODO_ and will be completed on _TODO_. Each milestone builds upon the previous, ensuring a structured and outcome-driven development process.