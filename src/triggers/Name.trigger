trigger Name on Account (before insert) {

   for(Account a:trigger.new)
   {
       a.name='Dr'+a.name;
   }
}