/**
 * Given a running CAP service, the unit test should be able to get passed.
 *
 * @param {Function} GET - The `axios` function to send a GET request
 * @param {Function} POST - The `axios` function to send a POST request
 * @param {Function} PATCH - The `axios` function to send a PATCH request
 * @param {Function} DELETE - The `axios` function to send a DELETE request
 * @param {Function} expect - The `chai` function to assert the response
 */
module.exports = async function(GET, POST, PATCH, DELETE, expect) {
  // Create a new draft for Cake
  let response = await POST('/service/cakeshop/Cake', {
    cakeID: 1,
    name: 'Test Cake',
    description: 'This is a test cake',
    price: 10.00,
    quantity: 100,
    expiryDate: '2022-12-31',
    category_ID: '00000000-0000-0000-0000-000000000001'
  });
  expect(response.status).to.be.oneOf([200, 201]);
  const cakeDraftID = response.data.ID;

  // Activate the draft Cake
  response = await POST(`/service/cakeshop/Cake(ID=${cakeDraftID},IsActiveEntity=false)/cakeshopSrv.draftActivate`);
  expect(response.status).to.be.oneOf([200, 201]);

  // Create a new draft for Order
  response = await POST('/service/cakeshop/Order', {
    orderID: 1,
    customerName: 'Test Customer',
    orderDate: '2022-01-01',
    status: 'New',
    cake_ID: cakeDraftID
  });
  expect(response.status).to.be.oneOf([200, 201]);
  const orderDraftID = response.data.ID;

  // Activate the draft Order
  response = await POST(`/service/cakeshop/Order(ID=${orderDraftID},IsActiveEntity=false)/cakeshopSrv.draftActivate`);
  expect(response.status).to.be.oneOf([200, 201]);

  // Edit the Order
  response = await POST(`/service/cakeshop/Order(ID=${orderDraftID},IsActiveEntity=true)/cakeshopSrv.draftEdit`, {
    PreserveChanges: true
  });
  expect(response.status).to.be.oneOf([200, 201]);

  // Modify the draft Order
  response = await PATCH(`/service/cakeshop/Order(ID=${orderDraftID},IsActiveEntity=false)`, {
    status: 'Processing'
  });
  expect(response.status).to.be.oneOf([200, 204]);

  // Activate the draft Order
  response = await POST(`/service/cakeshop/Order(ID=${orderDraftID},IsActiveEntity=false)/cakeshopSrv.draftActivate`);
  expect(response.status).to.be.oneOf([200, 201]);
};