Feature: GET Breeds with API with various limits

    Scenario Outline: Test API with valid limit values
        Given create scenario sample
        When execute with limit as query parameter
        Then it should validate the response data information

    Scenario Outline: Test API with various invalid limit values
        Given validate setup with limit "<limitValue>"
        When execute with limit as query parameter
        Then it should return error or invalid response

        Examples:
            | limitValue |
            | -1         |
            | 1.5        |
            | 999999999  |



