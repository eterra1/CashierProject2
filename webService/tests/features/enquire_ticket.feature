# Created by TESTE at 16/12/2016
Feature: Enquire ticket

  Scenario: Enquire valid ticket using barCode
    Given Enquire valid ticket using barCode
    Then the enquire ticket result is 0

  Scenario: Enquire valid ticket using ticketRef
    Given Enquire valid ticket using ticketRef
    Then the enquire ticket result is 0

  Scenario: Enquire redeemed ticket using barCode
    Given Enquire redeemed ticket using barCode
    Then the enquire ticket result is 4006

  Scenario: Enquire noInfo ticket using noInfo
    Given Enquire noInfo ticket using noInfo
    Then the enquire ticket result is 4006

  Scenario: Enquire redeemed ticket using barCode other venue
    Given Enquire redeemed ticket using barCode other venue
    Then the enquire ticket result is 3000

  Scenario: Enquire valid ticket using barCode other venue
    Given Enquire valid ticket using barCode other venue
    Then the enquire ticket result is 3000



