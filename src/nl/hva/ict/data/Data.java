package nl.hva.ict.data;

import java.util.List;

public interface Data<T> {

    List<T> getAll();
    T get();
    void add();
    void update();
    void remove();
}
