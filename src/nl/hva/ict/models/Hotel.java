package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

import java.io.Serializable;

public class Hotel extends Accommodatie implements Identifable, Serializable {
    private double prijsPerNacht;
    private boolean onbijt;

    public Hotel(String accommodatieCode, String naam, String stad, String land, String kamer, int personen, String soort, double prijsPerNacht, boolean onbijt) {
        super(accommodatieCode, naam, stad, land, kamer, personen, soort);
        this.prijsPerNacht = prijsPerNacht;
        this.onbijt = onbijt;
    }

    public double getPrijsPerNacht() {
        return prijsPerNacht;
    }

    public void setPrijsPerNacht(double prijsPerNacht) {
        this.prijsPerNacht = prijsPerNacht;
    }

    public boolean isOnbijt() {
        return onbijt;
    }

    public void setOnbijt(boolean onbijt) {
        this.onbijt = onbijt;
    }
    @Override
    public String toString() {
        return super.getKamer() + " heeft " + super.getPersoon() + " personen";
    }
}
