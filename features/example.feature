Feature: Example

  Scenario: Framework runs without error
    When I run the example feature
    Then I know the test set is running without error

  @example
  Scenario: Tagged scenario runs without error
    When I run a tagged scenario
    Then I know the test set is running without error