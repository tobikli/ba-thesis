#let artemis-integration-tests-workflow = ```yaml
name: Artemis Integration Tests
on:
  push:
    branches: [ main, master ]
  pull_request:
    branches: [ main, master ]
jobs:
  test:
    timeout-minutes: 60
    runs-on: [self-hosted, e2e-test]
    env:
      KEYCLOAK_USER: ${{ secrets.KEYCLOAK_USER }}
      KEYCLOAK_PWD: ${{ secrets.KEYCLOAK_PWD }}
      LANDINGPAGE_URL: ${{ vars.LANDINGPAGE_URL }}
      ARTEMIS_URL: ${{ vars.ARTEMIS_URL }}
      ARTEMIS_USER: ${{ secrets.ARTEMIS_USER }}
      ARTEMIS_PWD: ${{ secrets.ARTEMIS_PWD }}
      NUM_INSTANCES: 10

    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: lts/*
    - name: Install dependencies
      run: npm ci
    - name: Install Playwright Browsers
      run: npx playwright install --with-deps
    - name: Run Playwright tests
      run: npx playwright test --project=artemis --workers=1
    - uses: actions/upload-artifact@v4
      if: ${{ !cancelled() }}
      with:
        name: playwright-report
        path: playwright-report/
        retention-days: 30
        

```

#let execution-functional-tests = ```bash

 - To run the functional tests, run:
  npx playwright test --project=local

  - To run the load tests, run:
  npx playwright test --project=scale

  - To run the Artemis integration tests, run:
  npx playwright test --project=artemis

  - Set the amount of instances in the ENV file or pass it like this:
  NUM_INSTANCE=100 npx playwright test --project=scale

  - To run the tests using the Artillery.io framework, run:
  npx artillery run tests/ide/scalable/artillery/Artillery.ts
  

```