public class MerchandiseArchCls {
        public static void insertMerchandiseArch(List<Merchandise__c>mer)
    {
        Merchandise_Archive__c ma;
        List<Merchandise_Archive__c> malist = new List<Merchandise_Archive__c>();
        //Bulkify Trigger
        for(Merchandise__c m:mer)
        {
            ma = new Merchandise_Archive__c();
            ma.name=m.name;
            ma.Merchandise_Archive_Price__c=m.Merchandise_Price__c;
            ma.Merchandise_Archive_Stock__c=m.Merchandise_Stock__c;
            ma.Merchandise_Archive_Description__c=m.Merchandise_Desc__c;
            malist.add(ma);         
        }
        insert malist;
    }
 
}