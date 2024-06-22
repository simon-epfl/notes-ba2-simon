package cs108;

import java.util.HashSet;
import java.util.Set;

public abstract class AbstractSubject implements Subject {

    private Set<Observer> observers = new HashSet<>();

    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    protected void notifyObservers() {
        for (Observer observer: observers) {
            observer.update(this);
        }
    }

}
