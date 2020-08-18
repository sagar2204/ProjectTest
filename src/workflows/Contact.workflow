<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Account_suspended</fullName>
        <ccEmails>inboxofayushm@gmail.com</ccEmails>
        <ccEmails>sagarkakkar391@gmail.com</ccEmails>
        <description>Account suspended</description>
        <protected>false</protected>
        <recipients>
            <recipient>sagar.kakkar@grazitti.co.uk</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/annual_revenue</template>
    </alerts>
    <rules>
        <fullName>contact number</fullName>
        <actions>
            <name>Account_suspended</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.PostalCode</field>
            <operation>equals</operation>
            <value>133001</value>
        </criteriaItems>
        <description>pakdo sale ko</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
