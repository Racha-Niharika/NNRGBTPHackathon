using {com.satinfotech.salesdb as db} from '../db/schema';


service SalesDB {
    entity Sales as projection on db.Sales;
    entity States as projection on db.States;
    //entity Store as projection on db.Store;
    entity Stock as projection on db.Stock;

    
 entity Store            as projection on db.Store  {
         @UI.Hidden : true
        ID,
        * 
    };
    entity Product          as projection on db.Product {
         @UI.Hidden : true
        ID,
        * 
    };
     entity Unique_SID as projection on db.Unique_SID{
        @UI.Hidden: true
        ID,
        *
    };
    entity Unique_PID as projection on db.Unique_PID{
        @UI.Hidden: true
        ID,
        *
    };
    entity Unique_BPNUM as projection on db.Unique_BPNUM{
        @UI.Hidden: true
        ID,
        *
    };
 
    //entity Unique_Price as projection on db.Unique_Price;
    entity Unique_Qty as projection on db.Unique_Qty{
        @UI.Hidden: true
        ID,
        *
    };
    
    
//entity Product as projection on db.Product;
    
}
annotate SalesDB.Sales with @odata.draft.enabled;
annotate SalesDB.States with @odata.draft.enabled;
annotate SalesDB.Store with @odata.draft.enabled;
annotate SalesDB.Product with @odata.draft.enabled;
annotate SalesDB.Stock with @odata.draft.enabled;

annotate SalesDB.Sales with {
    pincode  @assert.format: '^[1-9][0-9]{5}$';
    gst_no @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[Z]{1}[0-9]{1}$';
    
    //telephone @assert.format: '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
    
};


    //telephone @assert.format: '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
annotate SalesDB.Sales with @(
    
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bno
        },
        
        {
            $Type : 'UI.DataField',
        
            Value : name
        },
        
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
              {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            Value: pincode
        },
        {
            Value: is_gstin
        },
        {
            Value: gst_no
        },
        {
            Value : is_gstin
        },
       
         {
            Value: is_vendor
        },
        {
            Value: is_customer
        }

    ],
    //UI.SelectionFields: [ first_name , last_name, email_id],    
    UI.FieldGroup #SalesInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bno,
            },
            {
                $Type : 'UI.DataField',

                Value : name,
            },
            
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value :city,
            },
            {
                $Type : 'UI.DataField',
                Value : state,
            },
            {
                $Type: 'UI.DataField',
                Value: pincode
            },
            
          {
                $Type : 'UI.DataField',

                Value : gst_no,
            },
            {
            Value : is_gstin
        },
        {
            Value : is_vendor
        }, 
        {
            Value : is_customer
        }  
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StudentInfoFacet',
            Label : 'Student Information',
            Target : '@UI.FieldGroup#SalesInformation',
        }
    ],
    
    
);

annotate SalesDB.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : stid
        },
        
        {
            $Type : 'UI.DataField',
        
            Value : name
        },
        
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
              {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            Value: pincode
        },
        

    ],
    //UI.SelectionFields: [ first_name , last_name, email_id],    
    UI.FieldGroup #storeInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : stid,
            },
            {
                $Type : 'UI.DataField',

                Value : name,
            },
            
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value :city,
            },
            {
                $Type : 'UI.DataField',
                Value : state,
            },
            {
                $Type: 'UI.DataField',
                Value: pincode,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StudentInfoFacet',
            Label : 'Student Information',
            Target : '@UI.FieldGroup#storeInformation',
        }
    ],
    
);

annotate SalesDB.States with @(
    UI.LineItem:[
        {
            @Type: 'UI.DataField',
            Value: code
        },
        {
            @Type: 'UI.DataField',
            Value: description
        },
    ]
);
annotate SalesDB.Sales with {
     state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'States',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
};
annotate SalesDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : pid
        },
        
        {
            $Type : 'UI.DataField',
        
            Value : pname
        },
        
        {
            $Type : 'UI.DataField',
            Value : imgurl
        },
        {
            $Type : 'UI.DataField',
            Value : pcp
        },
        {
            $Type : 'UI.DataField',
            Value : psp
        } 
        

    ],
    //UI.SelectionFields: [ first_name , last_name, email_id],    
    UI.FieldGroup #productInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : pid,
            },
            {
                $Type : 'UI.DataField',

                Value : pname,
            },
            
            {
                $Type : 'UI.DataField',
                Value : imgurl,
            },
            {
                $Type : 'UI.DataField',
                Value : pcp,
            },
            {
                $Type : 'UI.DataField',
                Value :psp,
            }
           
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StudentInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#productInformation',
        }
    ],
    
);
annotate SalesDB.Store with {
     state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'States',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
}
annotate SalesDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'StoreID',
            Value : store_id.code
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Label:'Stock Quantity',
            Value : stock_qty.code
        }
    ],  
);
annotate SalesDB.Stock with @(       
    UI.FieldGroup #StockInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty_ID
        }
        
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'stockInfoFacet',
            Label : 'Stock Information',
            Target : '@UI.FieldGroup#StockInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Unique_BPNUM with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);
annotate SalesDB.Unique_BPNUM with @(       
    UI.FieldGroup #Unique_BPNUMInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_BPNUMInfoFacet',
            Label : 'Unique_BPNUM Information',
            Target : '@UI.FieldGroup#Unique_BPNUMInformation',
        },
        
        
        
    ],    
);

annotate SalesDB.Unique_SID with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);

annotate SalesDB.Unique_SID with @(       
    UI.FieldGroup #Unique_SIDInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_SIDInfoFacet',
            Label : 'Unique_SID Information',
            Target : '@UI.FieldGroup#Unique_SIDInformation',
        },
        
        
        
    ],    
);
annotate SalesDB.Unique_Qty with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);

annotate SalesDB.Unique_Qty with @(       
    UI.FieldGroup #Unique_QtyInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_QtyInfoFacet',
            Label : 'Unique_Qty Information',
            Target : '@UI.FieldGroup#Unique_QtyInformation',
        },
    
    ],    
);
annotate SalesDB.Stock  with {
    product_id @(
        Common.Text: product_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Unique_PID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                },
            ]
        }
    )
};
annotate SalesDB.Stock  with {
    store_id @(
        Common.Text: product_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Unique_SID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                },
            ]
        }
    )
};
annotate SalesDB.Product with {
    pid @(
        Common.Text: pid.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Unique_PID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : pid_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                },
            ]
        }
    )
};
annotate SalesDB.Product with {
    @Common.Text:'{Product}'
    @Core.IsURL:true
    @Core.MediaType:'image/jpg' 
    imgurl
};