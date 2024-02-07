const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
    const { Sales,States,Store,Product } = this.entities();
    this.before(["CREATE"], Store, async (req) => {
       
    
        let query1 = SELECT.from(Store).where({ ref: ["pincode"] }, "=", {
          val: req.data.pincode,
        });
        result = await cds.run(query1);
        console.log(result);
        if (result.length > 0) {
          req.error({
            code: "STEMAILEXISTS",
            message: "Store with such pincode already exists",
            target: "pincode",
          });
        }
      });
      this.before("CREATE", Product, async (req) => {
        const { pcp, psp } = req.data;

        if (psp < pcp) {
            req.error({
                message: "Selling price must not be less than cost price"
            });
        }
    });
      
    
    this.on('READ',States,async(req)=>{
        states = [
          {"code":"Ts","description":"Telangana"},
          {"code":"Ap","description":"Andhra"}
        ]
        states.$count=states.length;
        return states;
      })
})
  