using {com.satinfotech.salesdb as db} from '../db/schema';


service SalesDB {
    entity Sales as projection on db.Sales;
    entity States as projection on db.States;

    
}
annotate SalesDB.Sales with @odata.draft.enabled;
annotate SalesDB.States with @odata.draft.enabled;
annotate SalesDB.Sales with {
    pincode  @assert.format: '^[1-9][0-9]{5}$';
    
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
}