Feature: Ejercicios clase 02
  Scenario: Consultar usuario por id
    Given  url "https://reqres.in/"
    And path "/api/users/2"
    When method get
    Then status 200

  Scenario: Caso 2 -Consultar usuario por id
    * def id = 1
    Given  url "https://reqres.in/"
    And path "/api/users/" + id
    When method get
    Then status 200
     * print response

  Scenario: Caso 3 -Consultar usuario por id
    * def id = 4
    Given  url "https://reqres.in"
    And path "/api/users/" + id
    When method get
    Then status 200
    And match response.data.id == 4
    * print response.data.last_name

  Scenario: Caso 4 -registrar usuario

    Given  url "https://reqres.in"
    And path "/api/register"
    And request {"email": "eve.holt@reqres.in","password": "pistol"}
    When method post
    Then status 200

  Scenario Outline: Caso 5-registrar usuario
* def body =
  """
  {
  "email": "<email>",
  "password": "<password>"
  }
  """
    Given  url "https://reqres.in"
    And path "/api/register"
    And request body
    When method post
    Then status 200
    And match response.id == '#notnull'

    Examples:
    |email              | password |
    |eve.holt@reqres.in | pistol   |

