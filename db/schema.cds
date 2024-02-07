namespace com.satinfotech.salesdb;
using { cuid, managed } from '@sap/cds/common';

@assert.unique:{
    bno:[bno]
}
entity Sales: cuid, managed {
    @title: 'Business Partner Number'
    bno: String(10);
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
    gst_no:String(10) @mandatory;
    @title : 'Is_gstn_registered'
    is_gstin : Boolean default false;
    @title: 'Is_vendor'
    is_vendor: Boolean default false;
    @title: 'Is_customer'
     is_customer: Boolean default false;
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