.PHONY: all
all: ./mvnw
	./mvnw verify

.PHONY: clean
clean:: ./mvnw
	./mvnw clean

.PHONY: mutation
mutation: ./mvnw
	./mvnw -q clean test org.pitest:pitest-maven:mutationCoverage

./mvnw:
	mvn -N io.takari:maven:0.7.7:wrapper
