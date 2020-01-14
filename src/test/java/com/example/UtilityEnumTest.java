package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class UtilityEnumTest {
    @Test
    void empty() {
        assertEquals(0L, UtilityEnum.sum());
    }

    @Test
    void one() {
        assertEquals(1L, UtilityEnum.sum(1));
    }
}
