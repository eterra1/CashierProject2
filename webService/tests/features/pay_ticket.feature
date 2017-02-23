# Created by TESTE at 16/12/2016
Feature: Pay tckets

  Scenario: Pay valid ticket

    Given Pay valid ticket
    Then the pay ticket result is 0

  Scenario: Pay invalid ticket
    Given Pay invalid ticket
    Then the pay ticket result is 3000

  Scenario: Pay ticket with no information
    Given Pay noInfo ticket
    Then the pay ticket result is 4006

  Scenario: Pay redeemed ticket
    Given Pay redeemed ticket
    Then the pay ticket result is 4006