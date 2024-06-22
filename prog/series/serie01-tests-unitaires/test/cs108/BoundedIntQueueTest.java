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

class BoundedIntQueueTest {

    @Test
    public void addLastThrowsOnFullQueue () {
        // we test several OK capacities
        for (int i = 1; i <= 1000; i++) {
            BoundedIntQueueBuggy queue = new BoundedIntQueueBuggy(i);
            for (int j = 0; j < i; j++) {
                queue.addLast(i);
            }
        }
        // we test several NOT OK capacities
        for (int i = 1; i <= 1000; i++) {
            final int currentIdx = i;
            assertThrows(IllegalStateException.class, () -> {
                BoundedIntQueueBuggy queue = new BoundedIntQueueBuggy(currentIdx);
                for (int j = 0; j <= currentIdx; j++) { // from 0 to i (i+1 added)
                    queue.addLast(currentIdx);
                }
            });
        }
    }

    @Test
    public void addLastAddsLastPosition () {
        BoundedIntQueue queue = new BoundedIntQueueBuggy(2 + 1); // +1 because of capacity bug
        queue.addLast(0);
        queue.addLast(1);
        assertEquals(0, queue.removeFirst());
        assertEquals(1, queue.removeFirst());
    }

    @Test
    public void sizeReturnsCorrectSize() {
        for (int i = 0; i < 1000; i++) {
            BoundedIntQueue queue = new BoundedIntQueueBuggy(1000);
            for (int j = 0; j < i; j++) {
                queue.addLast(0);
                assertEquals(j+1, queue.size());
            }
        }
    }

    @Test
    public void removeFirstThrowsOnEmptyQueue() {
        BoundedIntQueue queue = new BoundedIntQueueBuggy(10);
        assertThrows(IllegalStateException.class, () -> {
            int i = queue.removeFirst();
        });
    }

    @Test
    public void isFullReturnsCorrectValue() {
        BoundedIntQueue queue = new BoundedIntQueueBuggy(2);
        queue.addLast(0);
        assertFalse(queue.isFull());
        queue.addLast(1);
        assertTrue(queue.isFull());
    }

    @Test
    public void capacityReturnsCorrectValue() {
        for (int i = 0; i < 1000; i++) {
            BoundedIntQueue queue = new BoundedIntQueueBuggy(i);
            assertEquals(i, queue.capacity());
        }
    }
}