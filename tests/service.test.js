const test_order_created_logic_test = require('./code/test-order-created-logic-test');
const cds = require('@sap/cds/lib');
const {
  GET,
  POST,
  PATCH,
  DELETE,
  expect
} = cds.test(__dirname + '../../', '--with-mocks');
cds.env.requires.auth = {
  kind: "dummy"
};
describe('Service Testing', () => {
  it('test order-created-logic-test', async () => {
    await test_order_created_logic_test(GET, POST, PATCH, DELETE, expect);
  });
});