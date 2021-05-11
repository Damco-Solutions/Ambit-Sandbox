<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
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
