<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_CIBIL_Score</fullName>
        <field>CIBIL_Score__c</field>
        <formula>-001</formula>
        <name>Update CIBIL Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_Authorised_Person</fullName>
        <field>Authorised_Person__c</field>
        <name>update Authorised Person</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Status changed</fullName>
        <actions>
            <name>Applicant_Not_Contactable_Please_contact</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Status__c</field>
            <operation>equals</operation>
            <value>Not Contactable</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update CIBIL Score when 0 or -1</fullName>
        <actions>
            <name>Update_CIBIL_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Contact.CIBIL_Score__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.CIBIL_Score__c</field>
            <operation>equals</operation>
            <value>-1</value>
        </criteriaItems>
        <description>Default response from CIBIL is “0” or “-1” in case no CIBIL record exists for a client in which case this needs to be converted to “-001”</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Applicant_Not_Contactable_Please_contact</fullName>
        <assignedTo>crmadmin@ambit.co</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Open</status>
        <subject>Applicant Not Contactable- Please contact</subject>
    </tasks>
</Workflow>
