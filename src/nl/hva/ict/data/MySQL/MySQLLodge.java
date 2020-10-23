package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Lodge;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLLodge extends MySQL<Lodge> {

    private final List<Lodge> lodges;

    public MySQLLodge() {
        lodges = new ArrayList<>();
        load();
    }

    private void load() {

        String sql = "SELECT l.accommodatie_code, l.prijsPerWeek, l.autohuur, a.naam, a.stad, a.land, a.kamer, a.persoon, a .soort FROM Lodge AS l INNER JOIN Accommodatie as a ON l.accommodatie_code = a.accommodatie_code";

        if (sql.equals(""))
            return;


        try {
            PreparedStatement ps = getStatement(sql);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                String accommodatieCode = rs.getString("accommodatie_code");
                String naam = rs.getString("naam");
                String stad = rs.getString("stad");
                String land = rs.getString("land");
                String kamer = rs.getString("kamer");
                int personen = rs.getInt("persoon");
                String soort = rs.getString("soort");
                double prijsPerWeek = rs.getDouble("prijsPerWeek");
                boolean autohuur = rs.getBoolean("autohuur");

                lodges.add(new Lodge(accommodatieCode, naam, stad, land, kamer, personen, soort, prijsPerWeek, autohuur));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<Lodge> getAll() {
        return lodges;
    }

    @Override
    public Lodge get(String id) {
        return null;
    }

    @Override
    public void add(Lodge object) {

    }

    @Override
    public void update(Lodge object) {

    }

    @Override
    public void remove(Lodge object) {

    }

    public void reload() {
        lodges.clear();
        load();
    }
}

