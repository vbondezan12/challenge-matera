import { CatFactApi } from "../../../support/api_objects/catfact/catfact_api";
import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { faker } from "@faker-js/faker";

const catFactApi = new CatFactApi()
let queryLimit

Given("create scenario sample", function () {
    queryLimit = { limit: faker.number.int({ min: 1, max: 98 }) }
})

When("execute with limit as query parameter", () => {
    catFactApi.getBreeds(queryLimit).then((response) => {        
        const data = response.body.data
        cy.wrap(data).as('breedsData');
    })
})

Then("it should validate the response data information", () => {
    cy.get('@breedsData').then((data) => {
        expect(data).to.have.lengthOf(queryLimit.limit);
        expect(data[0]).to.have.all.keys('breed', 'country', 'origin', 'coat', 'pattern');
        expect(data).to.be.an('array');
    })
})

Given('validate setup with limit {string}', function (limitValue) {
    queryLimit = { limit: limitValue };
});

Then('it should return error or invalid response', function () {
    expect(this.response.status).to.not.equal(200);
});