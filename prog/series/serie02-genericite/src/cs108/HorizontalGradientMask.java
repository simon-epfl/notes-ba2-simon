package cs108;
import java.lang.Double;

public final class HorizontalGradientMask implements ImageRGB<Double> {

    @Override
    public Double apply(double x, double y) {
        return x < -1 ? 0 : x > 1 ? 1 : (x+1) / 2;
    }
}
