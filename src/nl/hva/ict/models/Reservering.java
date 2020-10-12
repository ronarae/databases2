package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

import java.io.Serializable;
import java.util.Date;

public class Reservering implements Identifable, Serializable {

    private int reservering_id;
    private boolean betaald;
    private Date aankomst_datum;
    private Date vertrek_datum;
    private String accommodatie_code;
    private String reizigers_code;

    public Reservering(int reservering_id, boolean betaald, Date aankomst_datum, Date vertrek_datum, String accommodatie_code, String reizigers_code) {
        this.reservering_id = reservering_id;
        this.betaald = betaald;
        this.aankomst_datum = aankomst_datum;
        this.vertrek_datum = vertrek_datum;
        this.accommodatie_code = accommodatie_code;
        this.reizigers_code = reizigers_code;
    }

    public Reservering() {

    }

    public int getReservering_id() {
        return reservering_id;
    }

    public void setReservering_id(int reservering_id) {
        this.reservering_id = reservering_id;
    }

    public boolean isBetaald() {
        return betaald;
    }

    public void setBetaald(boolean betaald) {
        this.betaald = betaald;
    }

    public Date getAankomst_datum() {
        return aankomst_datum;
    }

    public void setAankomst_datum(Date aankomst_datum) {
        this.aankomst_datum = aankomst_datum;
    }

    public Date getVertrek_datum() {
        return vertrek_datum;
    }

    public void setVertrek_datum(Date vertrek_datum) {
        this.vertrek_datum = vertrek_datum;
    }

    public String getAccommodatie_code() {
        return accommodatie_code;
    }

    public void setAccommodatie_code(String accommodatie_code) {
        this.accommodatie_code = accommodatie_code;
    }

    public String getReizigers_code() {
        return reizigers_code;
    }

    public void setReizigers_code(String reizigers_code) {
        this.reizigers_code = reizigers_code;
    }

    @Override
    public String toString() {
        return "Reservering{" +
                "reservering_id=" + reservering_id +
                ", betaald=" + betaald +
                ", aankomst_datum=" + aankomst_datum +
                ", vertrek_datum=" + vertrek_datum +
                ", accommodatie_code='" + accommodatie_code + '\'' +
                ", reizigers_code='" + reizigers_code + '\'' +
                '}';
    }
}
