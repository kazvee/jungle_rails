describe('adds a product to the cart', () => {
  
  it('visits home page', () => {
    cy.visit('/');
  });

  it('finds 0 products in the cart', () => {
    cy.contains('My Cart (0)');
  });

  it('clicks Add button to add product to cart', () => {
    cy.get('.btn').click({ force: true });
  });

  it('finds 1 products in the cart', () => {
    cy.contains('My Cart (1)');
  });
});