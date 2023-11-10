describe('visits home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('displays products on the page', () => {
    cy.get('.products article').should('be.visible');
  });
});