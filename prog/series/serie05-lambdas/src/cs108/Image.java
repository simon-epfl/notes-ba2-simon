package cs108;

import java.awt.*;
import java.util.function.BiFunction;

import static java.lang.Math.*;

/**
 * Une image continue et infinie, représentée par une fonction associant une
 * valeur d'un type donné (p.ex. une couleur) à chaque point du plan.
 */

@FunctionalInterface
public interface Image<T> {

    Image<ColorRGB> RedDisk = (x, y) -> {
        double r = sqrt(x * x + y * y);
        return r <= 1d ? ColorRGB.RED : ColorRGB.WHITE;
    };

    static <T> Image<T> constant(T value) {
        return (x, y) -> value;
    }

    Image<Double> HorizontalGradientMask = (x, y) -> max(0, min((x + 1d) / 2d, 1d));

    static Image<ColorRGB> chessboard(ColorRGB c1, ColorRGB c2, double w) {
        if (! (w > 0))
            throw new IllegalArgumentException("non-positive width: " + w);
        return (x, y) -> {
            int sqX = (int)floor(x / w), sqY = (int)floor(y / w);
            return (sqX + sqY) % 2 == 0 ? c1 : c2;
        };
    }

    static Image<ColorRGB> composed(Image<ColorRGB> bg, Image<ColorRGB> fg, Image<Double> mask) {
        return (x, y) -> bg.apply(x, y).mixWith(fg.apply(x, y), mask.apply(x, y));
    }

    static Image<Double> mandelbrot(int maxIt) {
        return (x, y) -> {
            int it = 0;

            double currentReal = 0;
            double currentImaginary = 0;

            BiFunction<Double, Double, Double> squaredModule = (a, b) -> Math.pow(a, 2) + Math.pow(b, 2);
            BiFunction<Double, Double, Double> module = (a, b) -> Math.sqrt(squaredModule.apply(a, b));

            while (module.apply(currentReal, currentImaginary) <= 2 && it < maxIt) {
                // z_[n-1]^2 = a^2 - b^2 + 2aib
                // + x + y
                double beforeUpdateReal = currentReal;
                currentReal = (Math.pow(currentReal, 2) - Math.pow(currentImaginary, 2)) + x;
                currentImaginary = 2*beforeUpdateReal*currentImaginary + y;
                it++;
            }
            return (double) (it/maxIt);
        };
    }

    default Image<T> rotated(double angle) {
        double cosA = cos(-angle);
        double sinA = sin(-angle);
        return (x, y) -> {
            double x1 = x * cosA - y * sinA;
            double y1 = x * sinA + y * cosA;
            return this.apply(x1, y1);
        };
    }

    T apply(double x, double y);
}
