# Pitest Bug #556

This repository serves as a test case to demonstrate the wrong coverage report by pitest in case of enums.
It contains two tested enums:
- `SingletonEnum` which represents the use of an enum as Singleton, similar to a regular enum.
- `UtilityEnum` which represents the use of an enum as utility class.

In both cases, it is expected that the enum constructor and enum constants are excluded from the coverage report.
They cannot reasonably be covered, as they are executed during class loading, not regular runtime.

The expected behavior is that the line coverage is 100%:
- All mutable code is covered (and the mutation test finds no surviving mutants).
- All non-mutable code is reasonably unreachable because it's executed by the class loader.

The actual behavior is that the line coverage is less than 100%: 17% in case of `SingletonEnum` and 50% in case of `UtilityEnum`.

## Results

The percentages are the line coverage.
The mutation coverage was always 100% and has thus not been included (deemed irrelevant) in the result.
Lines without coverage are due to problems.
For example, prior to Pitest 1.4.11, Java 14 was not supported yet.

| Java | PiTest | Singleton | Utility |
| ---- | ------ | --------- | ------- |
| 8 | 1.4.9 | 17% | 50% |
| 8 | 1.4.10 | 17% | 50% |
| 8 | 1.4.11 | 17% | 50% |
| 11 | 1.4.9 | 17% | 50% |
| 11 | 1.4.10 | 17% | 50% |
| 11 | 1.4.11 | 17% | 50% |
| 13 | 1.4.9 | 17% | 50% |
| 13 | 1.4.10 | 17% | 50% |
| 13 | 1.4.11 | 17% | 50% |
| 14 | 1.4.9 |  |  |
| 14 | 1.4.10 |  |  |
| 14 | 1.4.11 | 17% | 50% |
