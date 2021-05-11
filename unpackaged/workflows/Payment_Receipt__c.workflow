<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>update_customer_name</fullName>
        <field>Customer_Name__c</field>
        <formula>Collection_Task__r.Customer__r.Id</formula>
        <name>update customer name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>update customer name</fullName>
        <actions>
            <name>update_customer_name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Payment_Receipt__c.Customer_Name__c</field>
            <operation>equals</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>update customer name from collection task</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
