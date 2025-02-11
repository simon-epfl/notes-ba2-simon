package cs108;

/**
 * Une image continue et infinie, représentée par une fonction associant une
 * couleur à chaque point du plan.
 */

public interface ImageRGB<T> {
    T apply(double x, double y);
}
