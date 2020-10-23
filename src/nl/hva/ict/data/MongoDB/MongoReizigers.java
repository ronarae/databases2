//package nl.hva.ict.data.MongoDB;
//
//import com.mongodb.client.MongoCursor;
//import nl.hva.ict.models.Reiziger;
//import org.bson.Document;
//
//import java.util.ArrayList;
//import java.util.List;
//
//public class MongoReizigers  extends MongoDB {
//
//    private List<Reiziger> reizigers;
//
//    public MongoReizigers() {
//        reizigers = new ArrayList<>();
//        load();
//    }
//
//    public void load() {
//        this.selectedCollection("reizigers");
//
//        MongoCursor<Document> cursor = collection.find().iterator();
//
//        try {
//            while(cursor.hasNext()) {
//                Document tempReiziger  = cursor.next();
//                String reizigersCode = (String) tempReiziger.get("reizigers_code");
//                String voornaam = (String) tempReiziger.get("voornaam");
//                String achternaam = (String) tempReiziger.get("achternaam");
//                String postcode = (String) tempReiziger.get("postcode");
//                String straat = (String) tempReiziger.get("straat");
//                String plaats = (String) tempReiziger.get("plaats");
//                String land  = (String) tempReiziger.get("land");
//                String hoofdreiziger = (String) tempReiziger.get("hoofdreiziger");
//
//
//                Reiziger reiziger = new Reiziger(reizigersCode, voornaam, achternaam, straat, postcode, plaats, land, hoofdreiziger);
//                reizigers.add(reiziger);
//            }
//        } finally {
//            cursor.close();
//        }
//    }
//
//    @Override
//    public List getAll() {
//        return reizigers;
//    }
//
//    @Override
//    public Object get(String id) {
//        return null;
//    }
//
//    @Override
//    public void add(Object object) {
//
//    }
//
//    @Override
//    public void update(Object object) {
//
//    }
//
//    @Override
//    public void remove(Object object) {
//
//    }
//}
