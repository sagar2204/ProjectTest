public class SliderController{
    @AuraEnabled
    public static List<String>  getImages(String folderName){
       List<String> lstOfImagesUrl =new List<String>(); 
       List<Folder> folderLst= [select id from Folder where name=:folderName];
       List<Document> docList=[select id from Document where FolderId=:folderLst[0].id];
       for(Document doc:docList){
           lstOfImagesUrl.add(System.URL.getSalesforceBaseUrl().toExternalForm().replace('https','http')+'/servlet/servlet.ImageServer?id='+doc.id+'&oid='+UserInfo.getOrganizationId());
       }
       return lstOfImagesUrl ;
    }
}