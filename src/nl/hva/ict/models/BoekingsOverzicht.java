package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

public class BoekingsOverzicht implements Identifable {

    private Reiziger reiziger;
    private Accommodatie accommodatie;
    private Reservering reservering;



    public BoekingsOverzicht() {
    }

    public Reiziger getReiziger() {
        return reiziger;
    }

    public void setReiziger(Reiziger reiziger) {
        this.reiziger = reiziger;
    }

    @Override
    public String toString() {
        return "";
    }
}
