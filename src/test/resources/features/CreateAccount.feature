@Smoke
Feature: Create Account feature

  Background: Setup test and generate token
    * def result = callonce read('GenerateToken.feature')
    * def validToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create valid account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + validToken
    
    * def generateDataObject = Java.type('api.utility.data.GenerateData')
    
    * def autoEmail = generateDataObject.getEmail()
    
    And request
      """
      {
        "email": "#(autoEmail)",
        "firstName": "ScenarioTest",
        "lastName": "AutoTest",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "Accountant",
        "dateOfBirth": "1995-08-06",
        
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail
   
