package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Reiziger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLReizigers extends MySQL<Reiziger> {

    private final List<Reiziger> reizigers;

    public MySQLReizigers() {
        reizigers = new ArrayList<>();
        load();
    }

    private void load() {

        String sql = "SELECT * FROM Reiziger";

        try {
            PreparedStatement ps = getStatement(sql);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                String reizigersCode = rs.getString("reizigerCode");
                String voornaam = rs.getString("voornaam");
                String achternaam = rs.getString("achternaam");
                String adres = rs.getString("adres");
                String postcode = rs.getString("postcode");
                String plaats = rs.getString("plaats");
                String land = rs.getString("land");
                String hoofdreiziger = rs.getString("hoofdreiziger");
                Reiziger reiziger = new Reiziger(reizigersCode, voornaam, achternaam, adres, postcode, plaats, land, hoofdreiziger);
                reizigers.add(reiziger);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Reiziger> getAll() {
        return reizigers;
    }

    @Override
    public Reiziger get() {
        return null;
    }

    @Override
    public void add() {

    }

    @Override
    public void update() {

    }

    @Override
    public void remove() {

    }

    public void reload(){
        reizigers.clear();
        load();
    }

}
