package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Accommodatie;
import nl.hva.ict.models.BoekingsOverzicht;
import nl.hva.ict.models.Reiziger;
import nl.hva.ict.models.Reservering;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class MySQLBoekingsOverzicht extends MySQL<BoekingsOverzicht> {

    private final List<BoekingsOverzicht> boekingsOverzicht;

    public MySQLBoekingsOverzicht() {
        boekingsOverzicht = new ArrayList<>();
        load();
    }

    private void load() {

        //SQL
        String sql ="SELECT r.reservering_id, r.aankomst_datum, r.vertrek_datum, r.betaald, a.accommodatie_code, a.naam, a.stad, a.land, a.soort, reiziger.voornaam, reiziger.achternaam, reiziger.adres, reiziger.postcode, reiziger.plaats, reiziger.reizigers_code, reiziger.hoofdreiziger \n" +
                "FROM `reservering` AS r \n" +
                "INNER JOIN accommodatie AS a ON r.accommodatie_code = a.accommodatie_code \n" +
                "INNER JOIN reiziger ON r.reizigers_code = reiziger.reizigers_code";

        if (sql.equals(""))
            return;

        try {
            PreparedStatement ps = getStatement(sql);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                int reservering_id = rs.getInt("reservering_id");
                boolean betaald = rs.getBoolean("betaald");
                Date aankomst_datum = rs.getDate("aankomst_datum");
                Date vertrek_datum = rs.getDate("vertrek_datum");
                String accommodatie_code = rs.getString("accommodatie_code");
                String reizigers_code = rs.getString("reizigers_code");

                String voornaam = rs.getString("voornaam");
                String achternaam = rs.getString("achternaam");
                String adres = rs.getString("adres");
                String postcode = rs.getString("postcode");
                String plaats = rs.getString("plaats");
                String land = rs.getString("land");
                String hoofdreiziger = rs.getString("hoofdreiziger");
                String accommodatieNaam = rs.getString("naam");
                String accommodatieStad = rs.getString("stad");
                String accommodatieLand = rs.getString("land");
                String accommodatie_soort = rs.getString("soort");

                Reservering reservering = new Reservering(reservering_id, betaald,aankomst_datum, vertrek_datum,
                        accommodatie_code, reizigers_code);
                Reiziger reiziger = new Reiziger(reizigers_code, voornaam, achternaam, adres, postcode, plaats, land,
                        hoofdreiziger);

                Accommodatie accommodatie = new Accommodatie();
                accommodatie.setNaam(accommodatieNaam);
                accommodatie.setStad(accommodatieStad);
                accommodatie.setLand(accommodatieLand);

                boekingsOverzicht.add(new BoekingsOverzicht(reiziger, accommodatie, reservering));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<BoekingsOverzicht> getBoekingVoor(String reizigerscode) {

        List<BoekingsOverzicht> reserveringVoor = new ArrayList<>();

        //SQL
        String sql = "SELECT * FROM `reservering` AS r INNER JOIN accommodatie AS a ON r.accommodatie_code = a.accommodatie_code " +
                "INNER JOIN reiziger ON r.reizigers_code = reiziger.reizigers_code WHERE reiziger.reizigers_code = ?";

        try {
            PreparedStatement ps = getStatement(sql);
            ps.setString(1, reizigerscode);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                int reservering_id = rs.getInt("reservering_id");
                boolean betaald = rs.getBoolean("betaald");
                Date aankomst_datum = rs.getDate("aankomst_datum");
                Date vertrek_datum = rs.getDate("vertrek_datum");

                String accommodatie_code = rs.getString("accommodatie_code");
                String reizigers_code = rs.getString("reizigers_code");

                String reizigerVoornaam = rs.getString("voornaam");
                String reizigerAchternaam = rs.getString("achternaam");
                String reizigerPlaats = rs.getString("plaats");
                String accommodatieNaam = rs.getString("naam");
                String accommodatieStad = rs.getString("stad");
                String accommodatieLand = rs.getString("land");
                String accommodatieType = rs.getString("soort");

                Reservering reservering = new Reservering(reservering_id, betaald, aankomst_datum, vertrek_datum, accommodatie_code, reizigers_code);
                Accommodatie accommodatie = new Accommodatie();
                accommodatie.setNaam(accommodatieNaam);
                accommodatie.setStad(accommodatieStad);
                accommodatie.setLand(accommodatieLand);
                accommodatie.setType(accommodatieType);

                Reiziger reiziger = new Reiziger();
                reiziger.setVoornaam(reizigerVoornaam);
                reiziger.setAchternaam(reizigerAchternaam);
                reiziger.setPlaats(reizigerPlaats);

                reserveringVoor.add(new BoekingsOverzicht(reiziger, accommodatie,reservering));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return reserveringVoor;
    }

    public List<Reiziger> GeboektOp(String pCode, LocalDate pDatum) {

        List<Reiziger> geboektOp = new ArrayList<>();
        Date date = Date.valueOf(pDatum);

        //SQL
        String sql = String.format("SELECT reizigerscode, voornaam, achternaam, plaats FROM big_five_safari.reiziger " +
                "WHERE reizigerscode = big_five_safari.geboektOp('%s', '%s')", pCode, date);

        try {
            PreparedStatement ps = getStatement(sql);
            ps.setString(1, pCode);
            ps.setDate(2, date);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                String reizigerCode = rs.getString("reizigers_code");
                String reizigerVoornaam = rs.getString("voornaam");
                String reizigerAchternaam = rs.getString("achternaam");
                String reizigerPlaats = rs.getString("plaats");

                Reiziger reiziger = new Reiziger();
                reiziger.setReizigersCode(reizigerCode);
                reiziger.setVoornaam(reizigerVoornaam);
                reiziger.setAchternaam(reizigerAchternaam);
                reiziger.setPlaats(reizigerPlaats);
                geboektOp.add(reiziger);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return geboektOp;
    }

    @Override
    public List<BoekingsOverzicht> getAll() {
        return boekingsOverzicht;
    }

    @Override
    public BoekingsOverzicht get(String id) {
        return null;
    }

    @Override
    public void add(BoekingsOverzicht object) {

    }

    @Override
    public void update(BoekingsOverzicht object) {

    }

    @Override
    public void remove(BoekingsOverzicht object) {

    }
}
