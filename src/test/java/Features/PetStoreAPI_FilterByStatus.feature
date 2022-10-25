Feature: PetStore Application - Filter By Status

	@API_Test
  Scenario: Filter available pets
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=available'
    When method GET
    Then status 200
    And match response.[0].status == 'available'
    #Validate mandatory fields
    And match response.[*].name == '#ignore'
    And match response.[*].photoUrls == '#ignore'

	@API_Test
  Scenario: Filter pending pets
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=pending'
    When method GET
    Then status 200
    And match response.[0].status == 'pending'
    #Validate mandatory fields
    And match response.[*].name == '#ignore'
    And match response.[*].photoUrls == '#ignore'

	@API_Test
  Scenario: Filter sold pets
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method GET
    Then status 200
    And match response.[0].status == 'sold'
    #Validate mandatory fields
    And match response.[*].name == '#ignore'
    And match response.[*].photoUrls == '#ignore'

	@API_Test
  Scenario: Filter invalid status
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=invalid'
    When method GET
    Then status 400
