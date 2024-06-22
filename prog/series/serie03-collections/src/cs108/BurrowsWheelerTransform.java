package cs108;

import java.util.*;

public final class BurrowsWheelerTransform {
    private BurrowsWheelerTransform() {}

    private static List<String> getSortedRotations(String s) {
        Queue<Character> queue = new ArrayDeque<Character>();
        for (int i = 0; i < s.length(); i++) {
            queue.add(s.charAt(i));
        }

        List<String> rotations = new ArrayList<>();
        for (int i = 0; i < s.length(); i++) {
            rotations.add(queueToString(queue));
            queue.add(queue.poll());
        }

        Collections.sort(rotations);
        return rotations;
    }

    public static Pair<Integer, String> forward(String s) {

        if (s.isEmpty()) {
            throw new IllegalArgumentException();
        }

        List<String> rotations = getSortedRotations(s);

        StringBuilder str = new StringBuilder();
        Iterator<String> it = rotations.iterator();
        while (it.hasNext()) {
            str.append(it.next().charAt(s.length() - 1));
        }

        return new Pair<>(rotations.indexOf(s), str.toString());
    }

    private static String queueToString(Queue<Character> deque) {
        StringBuilder str = new StringBuilder();
        Iterator<Character> it = deque.iterator();
        while (it.hasNext()) {
            str.append(it.next());
        }
        return str.toString();
    }

    public static String backward(Pair<Integer, String> p) {
        if (p.first() >= p.second().length()) throw new IndexOutOfBoundsException();
        ArrayList<String> words = new ArrayList<>();
        for (int i = 0; i < p.second().length(); i++) {
            words.add(String.valueOf(p.second().charAt(i)));
        }
        Collections.sort(words);
        for (int i = 1; i < p.second().length(); i++) {
            for (int j = 0; j < p.second().length(); j++) {
                words.set(j, p.second().charAt(j) + words.get(j));
            }
            Collections.sort(words);
        }
        return words.get(p.first());
    }

}
