@Smoke
Feature: Token Verify

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def validToken = result.response.token

  Scenario: Send a valid/ existing primary person id and validate response
    Given path "/api/accounts/get-account"
    * def existingId = "9334"
    And param primaryPersonId = existingId
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == existingId

  Scenario: Verify get-account with id not exist
    Given path "/api/accounts/get-account"
    * def existingId = "007"
    And param primaryPersonId = existingId
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id 7 not found"

  Scenario: get all plan code
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    And assert response[0].planExpired == false
    And assert response[1].planExpired == false
    And assert response[2].planExpired == false
    And assert response[3].planExpired == false
