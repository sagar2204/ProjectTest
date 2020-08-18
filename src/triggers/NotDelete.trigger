trigger NotDelete on Account (before delete) 
{
for(Account acct:trigger.old)
{
    acct.adderror('You dont have the access to delete this account');
}
}