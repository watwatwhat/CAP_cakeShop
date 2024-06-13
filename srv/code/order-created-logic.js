/**
 * When an order is registered, the stock of Cake is reduced by one at the same time.
 * @After(event = { "CREATE" }, entity = "cakeshopSrv.Order")
 * @param {(Object|Object[])} results - For the After phase only: the results of the event processing
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(results, request) {
    // If results is not an array, make it an array
    if (!Array.isArray(results)) {
        results = [results];
    }

    // Loop through each result
    for (const result of results) {
        // Get the cake ID from the result
        const cakeID = result.cake_ID;

        // Get the current quantity of the cake
        const { quantity } = await SELECT.one(['quantity']).from('cakeshopSrv.Cake').where({ ID: cakeID });

        // If the quantity is greater than 0, reduce it by one
        if (quantity > 0) {
            await UPDATE('cakeshopSrv.Cake')
                .set({ quantity: quantity - 1 })
                .where({ ID: cakeID });
        } else {
            throw new Error('The cake is out of stock.');
        }
    }
}