# Created by TESTE at 16/12/2016
Feature: Enquire issue credit

  Scenario: Enquire issue credit with current bar pos

    Given A valide machine  bar possition 333
    Then I get a erro code 0

  Scenario: Enquire issue credit with current bar pos 2 last digit

    Given A valide machine  bar possition 33
    Then I get a erro code 0

  Scenario: Enquire issue credit with current bar pos last digit

    Given A valide machine  bar possition 3
    Then I get a erro code 0

  Scenario: Enquire issue credit with unexisting  bar pos
    
    Given A invalid machine  bar possition 321
    Then I get a erro code 4002

