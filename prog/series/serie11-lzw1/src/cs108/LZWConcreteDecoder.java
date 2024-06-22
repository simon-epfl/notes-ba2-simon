package cs108;

import java.util.ArrayList;
import java.util.List;
import java.util.SortedSet;

public class LZWConcreteDecoder implements LZWDecoder {

    public final SortedSet<Character> alphabet;
    public final int dictCapacity;

    public LZWConcreteDecoder (SortedSet<Character> alphabet, int dictCapacity) {
        if (dictCapacity < alphabet.size()) throw new IllegalArgumentException();
        this.alphabet = alphabet;
        this.dictCapacity = dictCapacity;
    }

    @Override
    public String decode(List<Integer> l) {

        List<String> dict = new ArrayList<>(alphabet.stream()
            .map(Object::toString)
            .toList());

        StringBuilder sb = new StringBuilder();
        String elementPrecedent = null;
        for (int idx: l) {
            // chaîne courante
            if ((dict.size() -1) < idx) {
                dict.add(dict.get(idx -1) + dict.get(idx -1).charAt(0));
                elementPrecedent = dict.get(idx -1) + dict.get(idx -1).charAt(0);
                sb.append(dict.get(idx -1) + dict.get(idx -1).charAt(0));
            } else {
                String chaineCourante = dict.get(idx);
                if (elementPrecedent == null) {
                    sb.append(chaineCourante);
                    elementPrecedent = dict.get(idx);
                } else {
                    if (dict.size() < dictCapacity) {
                        dict.add(elementPrecedent + chaineCourante.charAt(0));
                        elementPrecedent = chaineCourante;
                        sb.append(chaineCourante);
                    } else {
                        sb.append(chaineCourante);
                    }
                }
            }
        }
        System.out.println(dict);
        return sb.toString();
    }
}
