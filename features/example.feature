Feature: Example

  @example
  Scenario: I can run tagged scenarios
    When I run a tagged scenario
    Then I know the test set is running without error

  @example
  Scenario: I can test using a browser
    When I use the application
    Then it is available to me