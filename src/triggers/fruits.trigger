trigger fruits on Idea (Before insert,before update) 
{
    
    map<string,string> fruitsvalues =new map<string,string>();
    fruitsvalues.put('apple','red');
    fruitsvalues.put('Banana','yellow');
    fruitsvalues.put('Orange','orange');
    fruitsvalues.put('Pears','green');
    fruitsvalues.put('Grapes','Grapes');
    system.debug('The keyset values are'+fruitsvalues.keySet());
    

}