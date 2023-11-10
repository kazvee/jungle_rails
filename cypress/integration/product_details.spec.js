describe('navigates to product detail page from home page', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('clicks the first product on the page and views the product details page', () => {
    cy.get('.products article').should('be.visible').first().click();
    cy.url().should('include', '/products');
  });
});