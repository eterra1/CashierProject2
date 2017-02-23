# Created by TESTE at 16/12/2016
Feature: Using different bar position to validate the machines

  Scenario: Enquire valid machines with current bar pos
    Given the machine bar pos 333
    Then the enquire machine result is 0

  Scenario: Enquire valid machines with current bar pos 2 digit
    Given the machine bar pos 33
    Then the enquire machine result is 4002
  Scenario: Enquire valid machines with current bar pos last digit
    Given the machine bar pos 3
    Then the enquire machine result is 4002
