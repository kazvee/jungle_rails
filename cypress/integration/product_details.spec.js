describe('navigates from the home page to the product detail page by clicking on a product', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('clicks the first product on the page and views the product details page', () => {
    cy.get('.products article').should('be.visible').first().click();
    cy.url().should('include', '/products');
  });
});