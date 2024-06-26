/**
 * Code is auto-generated by Application Logic, DO NOT EDIT.
 * @version(2.0)
 */
const LCAPApplicationService = require('@sap/low-code-event-handler');
const order_Created_Logic = require('./code/order-created-logic');
const order_Created_Logic_Test = require('./code/order-created-logic-test');

class cakeshopSrv extends LCAPApplicationService {
    async init() {

        this.after('CREATE', 'Order', async (results, request) => {
            await order_Created_Logic(results, request);
        });

        this.after('CREATE', 'Order', async (results, request) => {
            await order_Created_Logic_Test(results, request);
        });

        return super.init();
    }
}


module.exports = {
    cakeshopSrv
};