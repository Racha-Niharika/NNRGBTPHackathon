const cds = require("@sap/cds");
//const urlRegex = '/^(ftp|http|https):\/\/[^ "]+$/';
module.exports = cds.service.impl(function () {
    const { Sales,States,Store,Product } = this.entities();
    const isValidImageUrl = (url) => {
      // Regular expression pattern to validate URL format
     // const urlPattern =/^(https?):\/\/.*\.(?:jpg|gif|png)$/;

      // Test if the URL matches the pattern
      return urlPattern.test(url);
  };
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
        const { imgurl } = req.data;

        // Check if the imgurl is a valid URL
        /*
        if (!isValidImageUrl(imgurl)) {
            req.error({
                code: "INVALID_IMGURL",
                message: "Invalid image URL format",
               
            });
        }
        */

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
  