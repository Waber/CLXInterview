Feature: Operating on pet store with API
  Users should be able to submit GET, POST, PUT and DELETE requests to a web service

  @TestGroup
  Scenario: get all pets with status: available
#GIVEN the user 'test' is authenticated for session
    When GET request is made to https://petstore3.swagger.io/api/v3/pet/findByStatus endpoint with status available parameter
    Then the request status 200 is returned
    And the list of elements with status available is displayed

  @TestGroup
  Scenario: add a new pet
 # GIVEN the user 'test' is authenticated for session
    When POST request is made to https://petstore3.swagger.io/api/v3/pet endpoint with the body C:\Testy\CLXInterview\src\main\resources\jsons\newPetBodyRequest.json
    Then the request status 200 is returned
    And the body is as is C:\Testy\CLXInterview\src\main\resources\jsons\newPetBodyRequest.json

  @TestGroup
  Scenario: change the status of a pet to 'sold'
  #GIVEN the user 'test' is authenticated for session
    Given POST request is made to https://petstore3.swagger.io/api/v3/pet endpoint with the body C:\Testy\CLXInterview\src\main\resources\jsons\newPetBodyRequest.json
    When PUT request is made to https://petstore3.swagger.io/api/v3/pet endpoint with the body C:\Testy\CLXInterview\src\main\resources\jsons\changeStatusPetBodyRequest.json
    Then the request status 200 is returned
    And field status has value sold

  @TestGroup
  Scenario: delete an existing pet
    Given POST request is made to https://petstore3.swagger.io/api/v3/pet endpoint with the body C:\Testy\CLXInterview\src\main\resources\jsons\newPetBodyRequest.json
    When DELETE request to https://petstore3.swagger.io/api/v3/pet/6541 is made
    Then the request status 200 is returned
    Then GET request to https://petstore3.swagger.io/api/v3/pet/6541 returns code 404
