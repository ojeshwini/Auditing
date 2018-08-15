alter table tbl_compliance_audit drop column Audit_Status;


alter table tbl_compliance_audit add column Audit_Status varchar(450);

alter table tbl_compliance_audit  add column  Part_Compliance_Percent decimal;
