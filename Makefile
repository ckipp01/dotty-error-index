build:
	./build.sh

check:
	./checker.sh check $(id)

clean:
	rm -rf out/

run:
	./checker.sh run $(id)

update:
	./checker.sh update-checkfiles $(id)
