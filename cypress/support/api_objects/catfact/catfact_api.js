
const defaultHeader = require('C:/Projetos/challenge-matera/cypress/fixtures/header.json')
const baseUrl = 'https://catfact.ninja'

export class CatFactApi {

    getBreeds(queryParameter){
        return cy.request({
            method: 'GET',
            qs: queryParameter,
            url: `${ baseUrl }/breeds`,
            failOnStatusCode: false,
            headers: defaultHeader
        })
    }
}