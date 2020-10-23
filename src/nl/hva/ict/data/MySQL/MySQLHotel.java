package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Hotel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLHotel extends MySQL<Hotel>{
    private final List<Hotel> hotels;

    public MySQLHotel() {
        hotels = new ArrayList<>();
        load();
    }

    private void load() {
        String sql = "SELECT h.accommodatie_code, h.prijsPerNacht, h.onbijt, a.naam, a.stad, a.land, a.kamer, a.soort, a.persoon FROM Hotel AS h INNER JOIN Accommodatie AS a ON h.accommodatie_code = a.accommodatie_code";

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
                double prijsPerNacht = rs.getDouble("prijsPerNacht");
                boolean ontbijt = rs.getBoolean("onbijt");
                hotels.add(new Hotel(accommodatieCode, naam, stad, land, kamer, personen, soort, prijsPerNacht, ontbijt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Hotel> getAll() {
        return hotels;
    }

    @Override
    public Hotel get(String id) {
        return null;
    }

    @Override
    public void add(Hotel object) {

    }

    @Override
    public void update(Hotel object) {

    }

    @Override
    public void remove(Hotel object) {
        //stored procedures
        String sql = "CALL verwijderAccommodatie(?);";

        if (object == null)
            return;

        try {
            PreparedStatement ps = getStatement(sql);
            ps.setString(1, object.getAccommodatie_code());
            ResultSet rs = executeSelectPreparedStatement(ps);
            reload();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void reload() {
        hotels.clear();
        load();
    }

}
