package cs108;

import java.util.Arrays;

/**
 overflow system

 [4, null, null] firstElementIdx = 0, lastElementIdx = 0
 [4, 5, null] firstElementIdx = 0, lastElementIdx = 1
 [4, 5, 6] firstElementIdx = 0, lastElementIdx = 2
 [null, 5, 6] firstElementIdx = 1, lastElementIdx = 2
 [7, 5, 6] firstElementIdx = 1, lastElementIdx = 0
 [7, null, 6] firstElementIdx = 2, lastElementIdx = 0
 [7, null, null] firstElementIdx = 0, lastElementIdx = 0
 */

public class BoundedIntQueueOk implements BoundedIntQueue {

    private final int[] storageArray;
    private final int[] ghostStorageArray;
    private int firstElementIdx = -1;
    private int lastElementIdx = -1;
    private int capacity;

    public BoundedIntQueueOk (int capacity) {
        storageArray = new int[capacity];
        ghostStorageArray = new int[capacity];
        Arrays.fill(ghostStorageArray, -1);
        this.capacity = capacity;
    }

    public int capacity () {
        return capacity;
    }

    public int size () {
        if (firstElementIdx == -1) {
            return 0;
        }
        int count = 0;
        if (lastElementIdx >= firstElementIdx) {
            count += lastElementIdx - firstElementIdx + 1;
        } else {
            count += capacity - firstElementIdx + lastElementIdx + 1;
        }
        return count;
    }


    public void printGhost() {
        System.out.println("Printing ghost...");
        for (int i = 0; i < ghostStorageArray.length; i++) {
            System.out.printf(" "+ghostStorageArray[i]);
        }
    }

    public void printStorage() {
        System.out.println("Printing storage...");
        for (int i = 0; i < storageArray.length; i++) {
            System.out.printf(" "+storageArray[i]);
        }
        System.out.println("\nLast element idx: " + lastElementIdx);
        System.out.println("First element idx: " + firstElementIdx);
        System.out.println("size: " + size());
    }

    public void addLast (int newElement) {
        //this.printGhost();
        if (isFull()) throw new IllegalStateException();
        if (lastElementIdx == capacity() - 1) {
            lastElementIdx = 0;
            storageArray[0] = newElement;
            ghostStorageArray[0] = 0;
        } else {
            lastElementIdx++;
            storageArray[lastElementIdx] = newElement;
            ghostStorageArray[lastElementIdx] = 0;
        }
        if (firstElementIdx == -1) {
            firstElementIdx = lastElementIdx;
        }
        //this.printGhost();
    }

    public int removeFirst () {
        if (isEmpty()) throw new IllegalStateException();
        int element = storageArray[firstElementIdx];
        ghostStorageArray[firstElementIdx] = -1;
        firstElementIdx = (firstElementIdx + 1) % capacity;
        if (ghostStorageArray[firstElementIdx] == -1) {
            firstElementIdx = -1;
        }
        return element;
    }

    public boolean isFull () {
        return size() >= capacity;
    }

    public boolean isEmpty () {
        return firstElementIdx == -1;
    }

}
