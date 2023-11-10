describe('visits home page', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('displays products on the page', () => {
    cy.get('.products article').should('be.visible');
  });

  it("there are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});