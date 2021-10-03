public with sharing class sObjectListViewController {
    //public sObjectListViewController() {
    //
    //}
    @AuraEnabled(cacheable=true)
    public static List<record> getRecords(String searchString, String nameField, String imageField){
        try{
            List<sObject> resultList = Database.query(searchString);    
            Schema.SObjectType dynamicObject = resultList.getSobjectType();
            Schema.DescribeSObjectResult describeSObject = dynamicObject.getDescribe();
            Map<String, SObjectField> dynamicObjectFieldMap = describeSObject.fields.getMap(); 
            List<record> recordList = new List<record>();
            for(sObject result : resultList) {
                record r = new record();
                List<recordField> fields = new List<recordField>();
                Map<String, Object> fieldsToValue = result.getPopulatedFieldsAsMap();
                for (String fieldName : fieldsToValue.keySet()){ 
                    if(fieldName == 'RecordTypeId' || fieldName == 'CurrencyIsoCode' || fieldName == 'Id') {

                    } else {
                        recordField f = new recordField();
                        sObjectField dynamicField = dynamicObjectFieldMap.get(fieldName);
                        String dynamicFieldLabel = dynamicField.getDescribe().getLabel();
                        f.fieldName = dynamicFieldLabel;
                        f.fieldValue = (String)fieldsToValue.get(fieldName);
                        if(fieldName == nameField) {
                            r.Name = f.fieldValue;              
                        } else if(fieldName == imageField) {
                            r.ImageURL = f.fieldValue;
                        } else {
                            fields.add(f);
                        }
                        
                    }
                    
                    
                }  
            
                r.fields = fields;			
                recordList.add(r);   
            } 
        return recordList;
        } 
        catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
        }
    }

    public class record{
        @AuraEnabled
        public String Id;
        @AuraEnabled
        public String Name;
        @AuraEnabled
        public String ImageURL;
        @AuraEnabled
        public List<recordField> fields;
    }

    public class recordField{
        @AuraEnabled
        public String fieldName;
        @AuraEnabled
        public String fieldValue;
    }
}
