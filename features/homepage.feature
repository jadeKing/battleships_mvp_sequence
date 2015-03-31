Feature: displays homepage
  In order to use the website
  As a user
  I want to see welcome message

  Scenario: A user visiting website
    Given a user is on the homepage
    Then they see "Enter your name to start game"

  Scenario: They can start a game
    Given a user is on the homepage
    When they fill in "Bob" in the title field
    And they press the "register" button
    Then they see "Welcome Bob, lets do some shooting!"
    And they see a "battleships_grid" table
