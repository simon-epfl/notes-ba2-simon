package cs108;

import java.awt.geom.Path2D;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;

public final class LSystemPainter {
    private LSystemPainter() {}

    public static Path2D paint(LSystem lSystem) {
        String s = lSystem.string();
        Turtle t = new Turtle();
        Deque<Turtle> turtles = new ArrayDeque<>();
        Path2D.Double p = new Path2D.Double();
        p.moveTo(t.x(), t.y());
        for (int i = 0; i < s.length(); i += 1) {
            char c = s.charAt(i);
            switch (c) {
                case '-' -> t = t.turned(-lSystem.turningAngle());
                case '+' -> t = t.turned(lSystem.turningAngle());
                case '[' -> turtles.add(t);
                case ']' -> {
                    t = turtles.remove();
                    p.moveTo(t.x(), t.y());
                }
                default -> {
                    if (lSystem.lineChars().contains(c)) {
                        t = t.moved(1);
                        p.lineTo(t.x(), t.y());
                    }
                }
            }
        }
        return p;
    }
}
