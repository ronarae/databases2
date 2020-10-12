package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

public class Accommodatie implements Identifable {

    private String accommodatie_code;
    private String naam;
    private String stad;
    private String land;
    private String kamer;
    private int persoon;
    private String soort;

    public Accommodatie(String accommodatie_code, String naam, String stad, String land, String kamer, int persoon, String soort) {
        this.accommodatie_code = accommodatie_code;
        this.naam = naam;
        this.stad = stad;
        this.land = land;
        this.kamer = kamer;
        this.persoon = persoon;
        this.soort = soort;
    }

    public Accommodatie(){

    }

    public String getType(){
        return soort;
    }

    public void setType(String type){

    }

    public String getAccommodatie_code() {
        return accommodatie_code;
    }

    public void setAccommodatie_code(String accommodatie_code) {
        this.accommodatie_code = accommodatie_code;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public String getStad() {
        return stad;
    }

    public void setStad(String stad) {
        this.stad = stad;
    }

    public String getLand() {
        return land;
    }

    public void setLand(String land) {
        this.land = land;
    }

    public String getKamer() {
        return kamer;
    }

    public void setKamer(String kamer) {
        this.kamer = kamer;
    }

    public int getPersoon() {
        return persoon;
    }

    public void setPersoon(int persoon) {
        this.persoon = persoon;
    }

    @Override
    public String toString(){
        return naam + " - " + stad + " - " + land;
    }
}
