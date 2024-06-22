package cs108;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;
import java.util.stream.Collectors;

public final class Main {

    static int[] byteFrequencies(String fileName) throws IOException {
        try (InputStream stream = new FileInputStream(fileName)) {
            boolean endOfStream =  false;
            int[] occurrences = new int[256];
            while (!endOfStream) {
                int read = stream.read();
                if (read == -1) endOfStream = true;
                else occurrences[read]++;
            }
            return occurrences;
        }
    }

    static double average(int[] freq) {
        int weightedAverage = 0;
        for (int i = 0; i <= 255; i++) {
            weightedAverage += freq[i] * i;
        }
        return (double) weightedAverage / 256;
    }

    static double entropy(int[] freq) {
        double entropy = 0;
        double sumOfFreq = Arrays.stream(freq).asDoubleStream().sum();
        for (int i = 0; i <= 255; i++) {
            double p = freq[i]/sumOfFreq;
            if (p != 0) {
                entropy += Math.log(p)/Math.log(2)*p;
            }
        }
        return -entropy;
    }

    static String stemAndLeafPlot (int[] freq) {
        StringJoiner sj = new StringJoiner("\n");
        StringBuilder sb = new StringBuilder("0|");
        Map<Integer, List<Integer>> maxFrequency = Arrays.stream(freq)
                .boxed() // convert to integers!
                .collect(Collectors.groupingBy(i -> i / 10)); // {0: 1111, 2: 1872}
        int maxSum = maxFrequency.values().stream().mapToInt(list -> list.stream().mapToInt(Integer::intValue).sum()).max().orElse(0);
        int lastLeaf = 0;
        for (int i = 0; i <= 255; i++) {
            int leaf = i / 10;
            if (lastLeaf != leaf) {
                sj.add(sb);
                sb = new StringBuilder();
                sb.append(leaf);
                sb.append("|");
                lastLeaf = leaf;
            }
            sb.append(String.valueOf(i%10).repeat(Math.max(0, freq[i])));
        }
        sj.add(sb);
        return sj.toString();
    }

    public static void main(String[] args) throws IOException {
        System.out.println(Arrays.toString(byteFrequencies("file0.bin")));
        System.out.println(average(byteFrequencies("file0.bin")));

        System.out.println(average(byteFrequencies("file1.bin")));
        System.out.println(average(byteFrequencies("file2.bin")));
        System.out.println(average(byteFrequencies("file3.bin")));
        System.out.println(average(byteFrequencies("file4.bin")));
        System.out.println(average(byteFrequencies("file5.bin")));

        System.out.println(entropy(byteFrequencies("file0.bin")));

        System.out.println(entropy(byteFrequencies("file1.bin")));
        System.out.println(entropy(byteFrequencies("file2.bin")));
        System.out.println(entropy(byteFrequencies("file3.bin")));
        System.out.println(entropy(byteFrequencies("file4.bin"))); // entropy is high, prob. compressed
        System.out.println(entropy(byteFrequencies("file5.bin"))); // entropy is high, prob. compressed

        System.out.println(stemAndLeafPlot(byteFrequencies("file0.bin")));
        System.out.println(stemAndLeafPlot(byteFrequencies("file1.bin")));
        System.out.println(stemAndLeafPlot(byteFrequencies("file2.bin")));
        System.out.println(stemAndLeafPlot(byteFrequencies("file3.bin")));
        System.out.println(stemAndLeafPlot(byteFrequencies("file4.bin")));
        System.out.println(stemAndLeafPlot(byteFrequencies("file5.bin")));
    }
}
