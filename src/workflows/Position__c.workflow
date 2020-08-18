<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>high_sal</fullName>
        <ccEmails>sagar.kakkar@grazitti.com</ccEmails>
        <description>high sal</description>
        <protected>false</protected>
        <recipients>
            <recipient>sagar.kakkar@grazitti.co.uk</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/LowFRevene</template>
    </alerts>
    <fieldUpdates>
        <fullName>status_update</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>salary</fullName>
        <actions>
            <name>high_sal</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Position__c.Salary_Range__c</field>
            <operation>greaterThan</operation>
            <value>70000</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>update</fullName>
        <actions>
            <name>status_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>end_date__c &lt;  TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Position__c.end_date__c</offsetFromField>
            <timeLength>12</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
