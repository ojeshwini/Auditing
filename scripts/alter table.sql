UPDATE `auditdb`.`tbl_menus` SET `Page_URL`='/ManageOrganization/ListofCompany' WHERE `Menu_ID`='11';

ALTER TABLE `auditdb`.`audit_type` 
CHANGE COLUMN `Audit_Type_ID` `Compliance_Type_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Audit_Type_Name` `Compliance_Type_Name` VARCHAR(100) NULL DEFAULT NULL , RENAME TO  `auditdb`.`compliance_type` ;

ALTER TABLE `auditdb`.`tbl_compliance_xref` 
DROP FOREIGN KEY `tbl_compliance_xref_ibfk_2`;
ALTER TABLE `auditdb`.`tbl_compliance_xref` 
CHANGE COLUMN `Audit_Type_ID` `Compliance_Type_ID` INT(11) NULL DEFAULT NULL ;
ALTER TABLE `auditdb`.`tbl_compliance_xref` 
ADD CONSTRAINT `tbl_compliance_xref_ibfk_2`
  FOREIGN KEY (`Compliance_Type_ID`)
  REFERENCES `auditdb`.`compliance_type` (`Compliance_Type_ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

alter table tbl_compliance_branch_mapping 
add column Vendor_ID int,
Add constraint
FOREIGN KEY Vendor_ID (Vendor_ID)
REFERENCES tbl_org_hier(Org_Hier_ID)
ON DELETE cascade
ON UPDATE cascade;

alter table tbl_compliance_branch_mapping change Financial_Year Financial_Year  year;
alter table tbl_compliance_branch_mapping add column Auditing_start_date date;
alter table tbl_compliance_branch_mapping add column Auditing_end_date date;



