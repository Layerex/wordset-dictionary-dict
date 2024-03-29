DESTDIR = /usr/local/share/dict
CONFIG_FILE = /etc/dict/dictd.conf
DICTNAME = wordset-dictionary
DICTNAME_FULL = "Wordset Dictionary"
REVISION = "master"

DATADIR = data

define CONFIG
database ${DICTNAME} {
  data  ${DESTDIR}/${DICTNAME}.dict
  index ${DESTDIR}/${DICTNAME}.index
}
endef
export CONFIG

make:
	python3 wordset-dictionary-parse.py ${DATADIR} | dictfmt --utf8 --allchars -s ${DICTNAME_FULL} -j ${DICTNAME}

download:
	mkdir -p ${DATADIR}
	for letter in a b c d e f g h i j k l m misc n o p q r s t u v w x y z ; \
	do \
		curl --output-dir ${DATADIR} \
		     --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/${REVISION}/data/$$letter.json" ; \
	done

install: make
	mkdir -p ${DESTDIR}
	cp -f ${DICTNAME}.dict ${DICTNAME}.index ${DESTDIR}
	@echo "Don't forget to add following to dictd config (usually ${CONFIG_FILE}) and to restart dictd."
	@echo "$$CONFIG"

uninstall:
	rm -f ${DESTDIR}/${DICTNAME}.index ${DESTDIR}/${DICTNAME}.dict

clean:
	rm -f ${DICTNAME}.dict ${DICTNAME}.index

# end
