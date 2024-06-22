package cs108;

import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;

public final class Steganographer {
    private Steganographer() { }

    public static String extract(BufferedImage image) {

        int currentPos = 0;
        int pendingChar = 0;
        StringBuilder sb = new StringBuilder();

        for (int y = 0; y < image.getHeight(); y++) {
            for (int x = 0; x < image.getWidth(); x++) {

                int pixel = image.getRGB(x, y);
                int lsb = pixel & 1;
                int toAdd = lsb << (15 - currentPos++);
                pendingChar |= toAdd;

                if (currentPos == 16) {
                    if (pendingChar != 0) sb.append((char) pendingChar);
                    currentPos = 0;
                    pendingChar = 0;
                }
            }
        }

        return sb.toString();
    }

    public static BufferedImage insert(BufferedImage image, String string) {

        char[] toEncode = string.toCharArray();
        System.out.println(toEncode);

        for (int y = 0; y < image.getHeight(); y++) {
            for (int x = 0; x < image.getWidth(); x++) {

                int idx = y * image.getWidth() + x;
                // the index of the char to encode
                int idxCharToEncode = idx / 16;
                // the bit of the char to encode
                int idxCharBitToEncode = idx % 16;

                int rgb = image.getRGB(x, y);

                if (idxCharToEncode < toEncode.length) {
                    int charToEncode = toEncode[idxCharToEncode];
                    System.out.println(charToEncode);
                    int bitToEncode = charToEncode >> (15-idxCharBitToEncode) & 1;
                    if ((rgb & 1) == bitToEncode) {} // to nothing
                    else {
                        // 1 or 0
                        // 0    1
                        // 0    1
                        int newRgb = rgb ^ 1;
                        image.setRGB(x, y, newRgb);
                    }
                } else {
                    if ((rgb & 1) == 0) {}
                    else {
                        int newRgb = rgb ^ 1;
                        image.setRGB(x, y, newRgb);
                    }
                }

            }
        }

        return image;
    }
}
