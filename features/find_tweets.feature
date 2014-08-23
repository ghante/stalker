Feature: find tweets in which the user is mentioned

  Scenario: When I run the command with username
    It should find tweets and put them on screen

    When I run `stalk deepikapadukone`
    Then the exit status should be 0
    And the stdout should contain "message"
    And the stdout should contain "at"
    And the stdout should contain "by"