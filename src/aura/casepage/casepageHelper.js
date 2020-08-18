({
    gotoURL : function (component,url) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url   
        });
        urlEvent.fire(); 
    },
    // this function for buildData 
    buildData : function(component, helper) {
        var data1 = [];
        var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        console.log('pageSize',pageSize);
        var allData = component.get("v.Allcase");
        var x = (pageNumber-1)*pageSize;
        
        //creating data-table data
        for(; x<(pageNumber)*pageSize; x++){
            if(allData[x]){
                data1.push(allData[x]); 
            }
        }
        component.set("v.data", data1);
        
        helper.generatePageList(component, pageNumber);
    },
    
    
    generatePageList : function(component, pageNumber){
        pageNumber = parseInt(pageNumber);
        var pageList = [];
        var totalPages = component.get("v.totalPages");
        if(totalPages > 1){
            if(totalPages <=5){
                var counter = 1;
                for(; counter <= (totalPages); counter++){
                    pageList.push(counter);
                } 
            } else{
                if(pageNumber < 5){
                    pageList.push(1,2, 3, 4, 5);
                } else{ 
                    if(pageNumber>(totalPages-5)){
                        pageList.push(totalPages-4, totalPages-3, totalPages-2, totalPages-1,totalPages);
                    } else{
                        pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
                    }
                }
            }
        }
        else if(totalPages == 1){
            pageList.push(1);
        } 
        component.set("v.pageList", pageList);
    }
    
})