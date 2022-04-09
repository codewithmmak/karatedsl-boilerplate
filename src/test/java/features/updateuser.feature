Feature: Update user using PUT api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0; i<s; i++)
      text += pattern.charAt(Math.floor(Math.random()*pattern.length()));
      return text;
      }
      """
    * def randomString = random_string(10)
    * print randomString
        * def requestPayload =
      """
      {
             "name": "tom",
             "email": "unquieEmail@gmail.com",
             "gender": "female",
             "status": "active"
         }

      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Create a user with the given data
    #1st call: create a user with post call
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.id == '#present'
    #fetch the user id from the post call response
    * def userId = $.id
    * print userId
    #2nd call: put call -- to update the user
    * def requestPutPayload =
      """
      {
             "gender": "female",
             "status": "inactive"
         }

      """
    Given path '/public/v2/users/'+userId
    And request requestPutPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.id == '#present'
    And match $.id == userId
    And match $.name == 'tom'
    And match $.email == requestPayload.email
    And match $.gender == 'female'
    And match $.status == 'inactive'
