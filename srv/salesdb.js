const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
    const { Sales,States } = this.entities();
    this.on('READ',States,async(req)=>{
        states = [
          {"code":"Ts","description":"Telangana"},
          {"code":"Ap","description":"Andhra"}
        ]
        states.$count=states.length;
        return states;
      })
})
  