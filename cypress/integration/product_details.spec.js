describe('Product details', () => {

  beforeEach(() => {
    cy.visit('/')
  })

  it("renders products on the page", () => {
    cy.get('.products article').should("be.visible");
  });
  
  it("Users can navigate from the home page to a product page", () => {
    cy.get(".products article")
      .first()
      .click();
    cy.get(".product-detail").should("be.visible");
  });

});