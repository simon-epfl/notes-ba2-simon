package cs108;
import java.lang.Double;

public final class Composed implements ImageRGB<ColorRGB> {
    private final ImageRGB<ColorRGB> backgroundImage;
    private final ImageRGB<ColorRGB> foregroundImage;
    private final HorizontalGradientMask mask;

    public Composed(ImageRGB<ColorRGB> backgroundImage, ImageRGB<ColorRGB> foregroundImage, HorizontalGradientMask mask) {
        this.backgroundImage = backgroundImage;
        this.foregroundImage = foregroundImage;
        this.mask = mask;
    }

    @Override
    public ColorRGB apply(double x, double y) {
        ColorRGB bg = backgroundImage.apply(x, y);
        ColorRGB fg = foregroundImage.apply(x, y);
        return bg.mixWith(fg, mask.apply(x, y));
    }
}
