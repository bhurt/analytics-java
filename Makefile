
.PHONY: all
all: analytics.jar
	cp $< /mnt/projects/backend/lib/

-include jfiles.make

jfiles.make:
	echo JFILES= `find src/main -name \*.java` > $@

analytics.jar: classes $(JFILES)
	javac -classpath '/mnt/projects/backend/lib/*' -d classes $(JFILES)
	cd classes; jar cvf ../$@ *

classes:
	mkdir $@

clean:
	rm -rf classes jfiles.make

