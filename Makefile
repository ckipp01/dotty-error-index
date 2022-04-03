build:
	./bin/build.sh

check:
	./bin/checker.sh check $(id)

clean:
	rm -rf out/

run:
	./bin/checker.sh run $(id)

update:
	./bin/checker.sh update-checkfiles $(id)
