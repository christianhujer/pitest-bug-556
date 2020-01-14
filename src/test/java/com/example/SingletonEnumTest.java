package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class SingletonEnumTest {
    @Test
    void testWorld() {
        assertEquals("Hello, world!", SingletonEnum.INSTANCE.apply("world"));
    }
}
