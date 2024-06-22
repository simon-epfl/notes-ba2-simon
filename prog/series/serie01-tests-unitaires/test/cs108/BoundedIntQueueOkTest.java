package cs108;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Found errors:
 * capacity is actually capacity-1 (same for size, returns 1 more)
 * IllegalStateException is not thrown, it is an IllegalArgumentException
 * removeFirst does not remove the first element but the last one OR addLast adds first instead of last
 * removeFirst throws an IllegalArgumentException
 * isFullQueue works properly but can not be tested completely because of addLast not working
 * capacity is not working (adding +1 to the correct capacity)
 */

class BoundedIntQueueOkTest {

    @Test
    public void addLastThrowsOnFullQueue () {
        // we test several OK capacities
        for (int i = 1; i <= 1000; i++) {
            BoundedIntQueue queue = new BoundedIntQueueOk2(i);
            for (int j = 0; j < i; j++) {
                queue.addLast(i);
            }
        }
        // we test several NOT OK capacities
        for (int i = 1; i <= 1000; i++) {
            final int currentIdx = i;
            System.out.printf("i = " + i);
            assertThrows(IllegalStateException.class, () -> {
                BoundedIntQueue queue = new BoundedIntQueueOk2(currentIdx);
                for (int j = 0; j <= currentIdx; j++) { // from 0 to i (i+1 added)
                    queue.addLast(currentIdx);
                }
            });
        }
    }

    @Test
    public void addLastAddsLastPosition () {
        BoundedIntQueue queue = new BoundedIntQueueOk2(2 + 1); // +1 because of capacity bug
        queue.addLast(0);
        queue.addLast(1);
        assertEquals(0, queue.removeFirst());
        assertEquals(1, queue.removeFirst());
    }

    @Test
    public void sizeReturnsCorrectSize() {
        for (int i = 0; i < 1000; i++) {
            BoundedIntQueue queue = new BoundedIntQueueOk2(1000);
            for (int j = 0; j < i; j++) {
                queue.addLast(0);
                assertEquals(j+1, queue.size());
            }
        }
    }

    @Test
    public void removeFirstThrowsOnEmptyQueue() {
        BoundedIntQueue queue = new BoundedIntQueueOk2(10);
        assertThrows(IllegalStateException.class, () -> {
            int i = queue.removeFirst();
        });
    }

    @Test
    public void isFullReturnsCorrectValue() {
        BoundedIntQueue queue = new BoundedIntQueueOk2(2);
        queue.addLast(0);
        assertFalse(queue.isFull());
        queue.addLast(1);
        assertTrue(queue.isFull());
    }

    @Test
    public void capacityReturnsCorrectValue() {
        for (int i = 0; i < 1000; i++) {
            BoundedIntQueue queue = new BoundedIntQueueOk2(i);
            assertEquals(i, queue.capacity());
        }
    }

    @Test
    public void boundedQueueWorksOnTrivialValues() {
        BoundedIntQueueOk queue = new BoundedIntQueueOk(3);
        queue.addLast(4);
        queue.printGhost();
        queue.printStorage();
        queue.addLast(5);
        queue.printGhost();
        queue.printStorage();
        queue.addLast(6);
        queue.printGhost();
        queue.printStorage();
        assertEquals(4, queue.removeFirst());
        queue.printGhost();
        queue.printStorage();
        queue.addLast(7);
        queue.printGhost();
        queue.printStorage();
        assertThrows(IllegalStateException.class, () -> {
           queue.addLast(0);
        });
        assertEquals(5, queue.removeFirst());
        queue.printGhost();
        queue.printStorage();
    }

    @Test
    public void boundedQueueWorks() {
        BoundedIntQueueOk2 queue = new BoundedIntQueueOk2(3);
        queue.addLast(4);
        queue.printStorage();
        queue.addLast(3);
        queue.printStorage();
        System.out.println(queue.removeFirst());
        queue.printStorage();
        System.out.println(queue.removeFirst());
        System.out.println(queue.removeFirst());
    }
}