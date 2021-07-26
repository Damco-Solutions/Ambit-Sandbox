<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_for_testing</fullName>
        <description>Send email  for testing</description>
        <protected>false</protected>
        <recipients>
            <field>Applicant__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Meeting_completed_rating</template>
    </alerts>
    <rules>
        <fullName>meeting completed rating</fullName>
        <actions>
            <name>Send_email_for_testing</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>email_sent_successfully</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Meeting__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Meeting__c.Type__c</field>
            <operation>equals</operation>
            <value>Meeting </value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>email_sent_successfully</fullName>
        <assignedTo>testadmin@ambit.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Meeting__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Open</status>
        <subject>email sent successfully</subject>
    </tasks>
</Workflow>
