namespace com.satinfotech.salesdb;
using { cuid, managed } from '@sap/cds/common';

@assert.unique:{
    bno:[bno]
}
entity Sales: cuid, managed {
    @title: 'Business Partner Number'
    bno:Association to Unique_BPNUM;
    @title: 'Name'
    name: String(10);
    @title: 'Address1'
    address1: String(10);
     @title: 'Address2'
    address2: String(10);
     @title: 'City'
    city: String(10);
    @title: 'State'
    state:  String(10);
    @title: 'PINCode'
    pincode: String(7) ;
    @title:'GSTIN Number'
    gst_no:String(20) @mandatory;
    @title : 'Is_gstn_registered'
    is_gstin : Boolean default false;
    @title: 'Is_vendor'
    is_vendor: Boolean default false;
    @title: 'Is_customer'
     is_customer: Boolean default false;
}
entity Store: cuid, managed {
    @title: 'store id'
    stid: String(10);
    @title: 'Name'
    name: String(10);
    @title: 'Address1'
    address1: String(10);
     @title: 'Address2'
    address2: String(10);
     @title: 'City'
    city: String(10);
    @title: 'State'
    state:  String(10);
    @title: 'PINCode'
    pincode: String(7) ;
}
entity Product: cuid, managed {
    @title: 'product id'
    pid: Association to Unique_PID;
    @title: 'product Name'
    pname: String(10);
    @title: 'product image url'
    imgurl: String(100);
     @title: 'product cost price'
    pcp: Integer;
     @title: 'Product Selling Price'
    psp: Integer;
   
}

entity Stock : cuid, managed {
    @title: 'StoreID'
    store_id: Association to Unique_SID;
    @title: 'ProductID'
    product_id: Association to Unique_PID ;
    @title: 'Stock QTY'  
    stock_qty:Association to Unique_Qty;
}
entity Unique_SID : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}
entity Unique_PID : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}
entity Unique_Qty : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}
entity Unique_BPNUM : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}

@cds.persistence.skip
entity States {
    @title: 'code'
    key code: String(8);
    @title: 'Description'
    description: String(10);
}

/*entity StudentLanguages: managed,cuid {
    studentid: Association to Student;
    langid: Association to Languages;
}

entity CoursesBooks: managed,cuid {
    course: Association to Courses;
    bookid: Association to Books;
}*/


/*
entity Courses : cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
    @title: 'Books'
    Books: Composition of many {
        key ID: UUID;
        books: Association to Books;
    }
}

entity Languages: cuid, managed {
    @title: 'Code'
    code: String(2);
    @title: 'Description'
    description: String(20);
}

entity Books : cuid, managed {
    @title: 'Code'
    code: String(2);
    @title: 'Description'
    description: String(20);
}
*/