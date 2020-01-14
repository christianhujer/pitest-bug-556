package com.example;

import java.util.stream.LongStream;

public class UtilityEnum {
    ;

    public static long sum(final long... numbers) {
        return LongStream.of(numbers).sum();
    }
}
