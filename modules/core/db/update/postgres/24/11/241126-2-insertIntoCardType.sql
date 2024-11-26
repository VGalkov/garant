INSERT INTO ts_card_type (id,create_ts,created_by,"name",discriminator,doc_kind_id,doc_template_id,fields_xml) VALUES
	 ('bf459165-6647-69d9-766d-9c514218e562'::uuid,'2024-11-26 09:22:00.301','admin','garant$CreditOrder',427,NULL,NULL,'<?xml version="1.0" encoding="UTF-8"?>

<fields>
  <field name="projects" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docReceiver" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="resolution" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="number" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalAuthorEmail" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="finishDatePlan" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="orderText" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="orderCause" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="contractor" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docSender" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="theme" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="address" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalAuthorName" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalPublishState" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="organization" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="date" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="employeeExecutor" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="officeSignedBy" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="responseToDoc" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="officeExecutor" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="sender" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="receivingMethod" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="fromPortal" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docCopyReceiver" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="postTrackingNumber" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="parentCardAccess" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="credit" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="portalPublishErrorDescription" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="addressees" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="parentCard" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="availableForAll" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="workingType" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="docCategory" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="department" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="owner" inDocKind="true" visible="true" required="false" signed="false"/>
  <field name="comment" inDocKind="true" visible="true" required="false" signed="false"/>
</fields>
');
^
INSERT INTO df_doc_kind (create_ts,created_by,"version",update_ts,updated_by,delete_ts,deleted_by,doc_type_id,code,description,fields_xml,numerator_id,numerator_type,prefix,category_attrs_place,category_id,use_all_procs,organization_id,tab_name,create_only_by_template,disable_add_process_actors,portal_publish_allowed,available_to_create_on_mob_cl) VALUES
	 (NULL,NULL,1,NULL,NULL,NULL,NULL,'bf459165-6647-69d9-766d-9c514218e562'::uuid,'213',NULL,'<?xml version="1.0" encoding="UTF-8"?>

<fields>
  <field name="projects" visible="true" required="false" signed="false"/>
  <field name="docReceiver" visible="true" required="false" signed="false"/>
  <field name="resolution" visible="true" required="false" signed="false"/>
  <field name="number" visible="true" required="false" signed="false"/>
  <field name="portalAuthorEmail" visible="true" required="false" signed="false"/>
  <field name="finishDatePlan" visible="true" required="false" signed="false"/>
  <field name="orderText" visible="true" required="false" signed="false"/>
  <field name="orderCause" visible="true" required="false" signed="false"/>
  <field name="contractor" visible="true" required="false" signed="false"/>
  <field name="docSender" visible="true" required="false" signed="false"/>
  <field name="theme" visible="true" required="false" signed="false"/>
  <field name="address" visible="true" required="false" signed="false"/>
  <field name="portalAuthorName" visible="true" required="false" signed="false"/>
  <field name="portalPublishState" visible="true" required="false" signed="false"/>
  <field name="organization" visible="true" required="false" signed="false"/>
  <field name="date" visible="true" required="false" signed="false"/>
  <field name="employeeExecutor" visible="true" required="false" signed="false"/>
  <field name="officeSignedBy" visible="true" required="false" signed="false"/>
  <field name="responseToDoc" visible="true" required="false" signed="false"/>
  <field name="officeExecutor" visible="true" required="false" signed="false"/>
  <field name="sender" visible="true" required="false" signed="false"/>
  <field name="receivingMethod" visible="true" required="false" signed="false"/>
  <field name="fromPortal" visible="true" required="false" signed="false"/>
  <field name="docCopyReceiver" visible="true" required="false" signed="false"/>
  <field name="postTrackingNumber" visible="true" required="false" signed="false"/>
  <field name="parentCardAccess" visible="true" required="false" signed="false"/>
  <field name="credit" visible="true" required="false" signed="false"/>
  <field name="portalPublishErrorDescription" visible="true" required="false" signed="false"/>
  <field name="addressees" visible="true" required="false" signed="false"/>
  <field name="parentCard" visible="true" required="false" signed="false"/>
  <field name="availableForAll" visible="true" required="false" signed="false"/>
  <field name="workingType" visible="true" required="false" signed="false"/>
  <field name="docCategory" visible="true" required="false" signed="false"/>
  <field name="department" visible="true" required="false" signed="false"/>
  <field name="owner" visible="true" required="false" signed="false"/>
  <field name="comment" visible="true" required="false" signed="false"/>
</fields>
',NULL,1,NULL,1,'7922ad3a-b5f8-2f4c-052d-31b80dca4d16'::uuid,true,NULL,NULL,false,false,false,true);
^

update ts_card_type set doc_kind_id = '7922ad3a-b5f8-2f4c-052d-31b80dca4d16' where id='bf459165-6647-69d9-766d-9c514218e562';
^