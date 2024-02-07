using {com.satinfotech.salesdb as db} from '../db/schema';


service SalesDB {
    entity Sales as projection on db.Sales;
    entity States as projection on db.States;
    entity Store as projection on db.Store;

entity Product as projection on db.Product;
    
}
annotate SalesDB.Sales with @odata.draft.enabled;
annotate SalesDB.States with @odata.draft.enabled;
annotate SalesDB.Store with @odata.draft.enabled;
annotate SalesDB.Product with @odata.draft.enabled;
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