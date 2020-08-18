@isTest
public class TestCase {
    @isTest static void caseTeamMemberAssignmentTest()
    { 
        Account a=new Account(Name='sagar');
        insert a;
        //  UserRole r = new UserRole(DeveloperName = 'MyCustomRole', Name = 'My Role');
        //  insert r;
            User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'YOUR PROFILE'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US'
            // UserRoleId = r.Id
        );
        
        AccountTeamMember aa= new AccountTeamMember();
        aa.Accountid=a.id;
        aa.UserId=u.id;
        aa.TeamMemberRole='Named Support Engineer';
        insert aa;
        list<Case> csList =  new List<case>();
        
        caseteamrole CTR= new CaseTeamRole();
        CTR.Name='sagar';
        case c=new case();
        c.Accountid=a.id;
        c.Status='New';
        c.origin='Phone';
        insert c;
        caseteammember cc=new caseteammember();
        cc.parentid=c.id;
        cc.TeamRoleId=aa.TeamMemberRole;
        cc.MemberId=aa.UserId;
        insert cc; 
    }
}