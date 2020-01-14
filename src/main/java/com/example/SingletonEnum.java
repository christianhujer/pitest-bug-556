package com.example;

import java.util.function.Function;

public enum SingletonEnum implements Function<String, String> {
    INSTANCE("Hello");

    private final String greeting;

    SingletonEnum(final String greeting) {
        this.greeting = greeting;
    }

    public String apply(final String whom) {
        return greeting + ", " + whom + "!";
    }
}
