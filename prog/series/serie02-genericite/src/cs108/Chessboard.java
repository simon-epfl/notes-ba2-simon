package cs108;

import java.util.function.Consumer;

import static java.lang.Math.floor;
import static java.lang.Math.sqrt;

public final class Chessboard implements ImageRGB<ColorRGB> {
    public static final ImageRGB<ColorRGB> IMAGE = new Chessboard(0.5);

    private final double width;

    public Chessboard (double width) {
        if (width <= 0) throw new IllegalArgumentException();
        this.width = width;
    }

    @Override
    public ColorRGB apply(double x, double y) {
        // System.out.println(" x " + floor(x));
        // System.out.println(" y " + floor(y));
        return isFloorEven(x / width) == isFloorEven(y / width) ? ColorRGB.WHITE : ColorRGB.BLACK;
    }

    private boolean isFloorEven(double coordinates) {
        return floor(coordinates) % 2 == 0;
    }
}