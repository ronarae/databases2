package nl.hva.ict.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import nl.hva.ict.MainApplication;
import nl.hva.ict.models.Accommodatie;
import nl.hva.ict.models.Reiziger;
import nl.hva.ict.views.GeboektOpView;
import nl.hva.ict.views.View;

public class BoekingsGeboektOpController extends Controller {

    private GeboektOpView geboektOpView;
    private ObservableList<Accommodatie> accommodaties;


    public BoekingsGeboektOpController() {
        geboektOpView = new GeboektOpView();
        geboektOpView.getComboBoxAccommodaties().getSelectionModel().selectedItemProperty().addListener(event -> ListViewPerKlant());
        load();
    }

    private void load() {
        accommodaties = FXCollections.observableArrayList(MainApplication.getMySQLAccommodatie().getAll());
        geboektOpView.getComboBoxAccommodaties().setItems(accommodaties);
    }

    private void ListViewPerKlant() {
        // Wat is geselecteerd?
        Accommodatie selectedAccommodatie = (Accommodatie) geboektOpView.getComboBoxAccommodaties().getSelectionModel().getSelectedItem();
        // Haal data op van deze reiziger
        ObservableList<Reiziger> BoekingsOverzichtList = FXCollections.observableArrayList(MainApplication.getMySQLBoekingsOverzicht().GeboektOp(selectedAccommodatie.getAccommodatie_code(), geboektOpView.getDatePicker().getValue()));
        // Zet in listview
        geboektOpView.getBoekingsOverzichtListView().setItems(BoekingsOverzichtList);
    }

    @Override
    public View getView() {
        return geboektOpView;
    }
}
