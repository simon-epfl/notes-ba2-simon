package cs108;

import java.util.*;

public class LZWConcreteEncoder implements LZWEncoder {
    SortedSet<Character> characterSortedSet;
    int capcacity;

    public LZWConcreteEncoder(SortedSet<Character> characterSortedSet, int capcacity) {
        if (capcacity < characterSortedSet.size()) {
            throw new IllegalArgumentException();
        }
        this.characterSortedSet = characterSortedSet;
        this.capcacity = capcacity;
    }


    @Override
    public List<Integer> encode(String s) {
        List<Integer> integers = new ArrayList<>();
        int index = 0;

        Map<String, Integer> alphabetIndex = new TreeMap<>();

        // initialisation correcte de l'alphabet
        for (Character c : characterSortedSet) {
            alphabetIndex.put(c.toString(), index);
            ++index;
        }

        while (!s.isEmpty()) {
            int indexSub = 0;
            do {
                indexSub++;
            } while (
                indexSub <= s.length() &&
                alphabetIndex.containsKey(s.substring(0, indexSub)
            ));

            if (alphabetIndex.values().size() <= capcacity) {
                alphabetIndex.put(s.substring(0, indexSub), alphabetIndex.values().size());
            }

            System.out.println(s);

            integers.add(alphabetIndex.get(s.substring(0, indexSub - 1)));

            s = s.substring(indexSub - 1);

        }

        System.out.println(alphabetIndex.entrySet());
        System.out.println(integers.toString());


        return integers;


    }
}
