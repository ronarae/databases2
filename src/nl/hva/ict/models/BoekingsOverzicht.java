package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

public class BoekingsOverzicht implements Identifable {

    private Reiziger reiziger;
    private Accommodatie accommodatie;
    private Reservering reservering;



    public BoekingsOverzicht() {
    }

    public BoekingsOverzicht(Reiziger reiziger, Accommodatie accommodatie, Reservering reservering) {
        this.reiziger = reiziger;
        this.accommodatie = accommodatie;
        this.reservering = reservering;
    }

    public Reiziger getReiziger() {

        return reiziger;
    }

    public void setReiziger(Reiziger reiziger) {

        this.reiziger = reiziger;
    }

    public Accommodatie getAccommodatie() {
        return accommodatie;
    }

    public void setAccommodatie(Accommodatie accommodatie) {
        this.accommodatie = accommodatie;
    }

    public Reservering getReservering() {
        return reservering;
    }

    public void setReservering(Reservering reservering) {
        this.reservering = reservering;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(reiziger.getReizigersNaam());
        stringBuilder.append(" - reist van ");
        stringBuilder.append(reservering.getAankomst_datum());
        stringBuilder.append(" en verblijft gedurende : ");
        stringBuilder.append(reiziger.getVerblijfsduur());
        stringBuilder.append(" dagen in : ");
        stringBuilder.append(accommodatie.getKamer());
        stringBuilder.append(" in ");
        stringBuilder.append(accommodatie.getNaam());
        stringBuilder.append(" - ");
        stringBuilder.append(accommodatie.getStad());
        stringBuilder.append(" - ");
        stringBuilder.append(accommodatie.getLand());
        stringBuilder.append(" betaald? ");
        stringBuilder.append(reservering.isBetaald());

        return stringBuilder.toString();
    }
}
