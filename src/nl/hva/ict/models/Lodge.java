package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

import java.io.Serializable;

public class Lodge extends Accommodatie implements Identifable, Serializable {

    private double prijsPerWeek;
    private boolean autohuur;

    public Lodge() {
    }

    public Lodge(String accommodatieCode, String naam, String stad, String land, String kamer, int personen, String soort, double prijsPerWeek, boolean autohuur) {
        super(accommodatieCode, naam, stad, land, kamer, personen, soort);
        this.prijsPerWeek = prijsPerWeek;
        this.autohuur = autohuur;
    }

    public double getPrijsPerWeek() {
        return prijsPerWeek;
    }

    public void setPrijsPerWeek(double prijsPerWeek) {
        this.prijsPerWeek = prijsPerWeek;
    }

    public boolean isAutohuur() {
        return autohuur;
    }

    public void setAutohuur(boolean autohuur) {
        this.autohuur = autohuur;
    }

    @Override
    public String toString() {
        return super.getNaam() + " in " + super.getStad() + " - " + super.getLand();
    }

}

