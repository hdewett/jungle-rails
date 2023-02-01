describe('Product details', () => {

  beforeEach(() => {
    cy.visit('/')
  })

  it("adds item to cart when add button is clicked and cart increases by 1", () => {
    cy.get(".button_to > .btn")
      .first()
      .click({force: true});
    cy.contains(".end-0 > .nav-link", "My Cart (1)");
  });

});