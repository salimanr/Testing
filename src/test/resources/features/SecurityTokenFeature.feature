@Smoke
Feature: Security Token Tests

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  Scenario: Generate valid token with valid username and password
    #Prepare request
    And request {"username": "supervisor" , "password": "tek_supervisor"}
    When method post
    Then status 200

  ####You may can use each Scenario this way or use Scenario Outline to combine with | | #####
  #Scenario: validate token with invalid username
  #And request {"username": "BADsupervisor" , "password": "tek_supervisor"}
  #When method post
  #Then status 400
  #And print response
  # And assert response.errorMessage == "User not found"
  #Scenario: Validate token with invalid password
  #And request {"username": "supervisor" , "password": "WrongPassword"}
  #When method post
  #Then status 400
  #And print response
  # And assert response.errorMessage == "Password Not Matched"
  #We can also write the last two Scenario like this:
  Scenario Outline: Validate token with invalid username
    And request { "username": "<username>", "password": "<password>" }
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "<errorMessage>"

    Examples: 
      | username   | password       | errorMessage         |
      | wrongUse   | tek_supervisor | User not found       |
      | supervisor | wrongPass      | Password Not Matched |

      
      
      
      
      
      
      
      
      