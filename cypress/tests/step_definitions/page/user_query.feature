Feature: User Query Screen

    Scenario: Filter users by person type
        Given I am on the User Query Screen
        When I select "Pessoa Fisica" from the "Person Type" dropdown
        And I click the "Filtrar" button
        Then I should see a list of users who are Pessoa Fisica

    Scenario: Filter users by name
        Given I am on the User Query Screen
        When I enter "Vitor Bondezan" into the "Name" input field
        And I click the "Filtrar" button
        Then I should see a list of users with the name "Vitor Bondezan"

    Scenario: Filter users by email
        Given I am on the User Query Screen
        When I enter "test@test.com" into the "Email" input field
        And I click the "Filtrar" button
        Then I should see a list of users with the email "test@test.com"

    Scenario: Validate clear filter button
        Given I am on the User Query Screen
        When I select "Pessoa Fisica" from the "Person Type" dropdown
        And I enter "Vitor Bondezan" into the "Name" input field
        And I enter "test@test.com" into the "Email" input field
        And I click the "Limpar Filtros" button
        Then The fields filled should be cleared

    Scenario: No users found with applied filters
        Given I am on the User Query Screen
        When I select "Pessoa Juridica" from the "Person Type" dropdown
        And I enter "empresa Teste" into the "Name" input field
        And I click the "Filter" button
        Then I should see the error message "No users found"
        And the user list should be empty

    Scenario: Invalid filter fields
        Given I am on the User Query Screen
        When I enter "email.email.com" into the "Email" input field
        And I click the "Filter" button
        Then I should see an error message "Please enter a valid email address"
        And no filters should be applied