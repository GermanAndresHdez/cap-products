const cds = require("@sap/cds");

// module.exports = cds.service.impl(async function(srv) {
//   const { Incidents } = this.entities;
//   const sapbackend = await cds.connect.to("sapbackend");
//   srv.on("READ", Incidents, async (req) => {
//     return await sapbackend.tx(req).send({
//       query: req.query,
//       headers: {
//         Authorization: "Basic c2FwdWk1OnNhcHVpNQ==",
//       },
//     });
//   });
// });

module.exports = async (srv) => {
    const { Incidents } = this.entities;
    const sapbackend = await cds.connect.to("sapbackend");
    
    srv.on(["READ"], Incidents, async (req) => {

        let IncidentsQuery = SELECT.from(req.query.SELECT.from).limit(req.query.SELECT)

    });
};