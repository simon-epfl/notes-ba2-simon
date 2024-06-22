package cs108;

import java.util.*;

public record LSystem(String string, Map<Character, String> rules, Set<Character> lineChars, int turningAngle) {

    public LSystem {
        rules = Map.copyOf(rules);
        lineChars = Set.copyOf(lineChars);
    }

    public LSystem (String string, Map<Character, String> rules, String lineCharsString, int turningAngle) {
        this(string, rules, stringToSetOfChars(lineCharsString), turningAngle);
    }

    private static Set<Character> stringToSetOfChars (String str) {
        Set<Character> lineChars = new HashSet<>();
        for (int i = 0; i < str.length(); i++) {
            lineChars.add(str.charAt(i));
        }
        return lineChars;
    }

    public LSystem evolve() {
        StringBuilder newString = new StringBuilder();
        for (int i = 0; i < string.length(); i++) {
            Character currentChar = string.charAt(i);
            newString.append(rules.getOrDefault(currentChar, currentChar.toString()));
        }
        return new LSystem(newString.toString(), rules, lineChars, turningAngle);
    }

    public LSystem evolve(int steps) {
        LSystem lSystem = this;
        for (int i = 0; i < steps; i++) {
            lSystem = lSystem.evolve();
        }
        return lSystem;
    }

}
