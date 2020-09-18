package nl.hva.ict.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import nl.hva.ict.MainApplication;
import nl.hva.ict.models.Reiziger;
import nl.hva.ict.views.BoekingsoverzichtPerKlantView;
import nl.hva.ict.views.View;

public class BoekingsOverzichtPerKlantController extends Controller {

    private final BoekingsoverzichtPerKlantView boekingsoverzichtPerKlantView;

    public BoekingsOverzichtPerKlantController() {
        boekingsoverzichtPerKlantView = new BoekingsoverzichtPerKlantView();
        load();
    }

    private void load(){
        ObservableList<Reiziger> reizigers = FXCollections.observableArrayList(MainApplication.getMySQLReizigers().getAll());
        boekingsoverzichtPerKlantView.getComboBox().setItems(reizigers);
    }

    @Override
    public View getView() {
        return boekingsoverzichtPerKlantView;
    }
}
