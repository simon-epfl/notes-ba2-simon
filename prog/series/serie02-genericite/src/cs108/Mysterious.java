package cs108;

public final class Mysterious<T> implements ImageRGB<T> {
    private final ImageRGB<T> image;

    public Mysterious(ImageRGB<T> image) {
        this.image = image;
    }

    @Override
    public T apply(double x, double y) {
        return image.apply(x * 2, y);
    }
}
