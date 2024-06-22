package cs108;

public final class Rotated<T> implements ImageRGB<T> {
    private final ImageRGB<T> image;
    private final double angle;

    public Rotated(ImageRGB<T> image, double angle) {
        this.image = image;
        this.angle = angle;
    }

    private double getSin() {
        return Math.sin(Math.toRadians(angle));
    }

    private double getCos() {
        return Math.cos(Math.toRadians(angle));
    }

    @Override
    public T apply(double x, double y) {
        return image.apply(x * getCos() + y * getSin(), -x * getSin() + y * getCos());
    }
}
