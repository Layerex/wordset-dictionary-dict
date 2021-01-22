##
# wordset-dictionary-dict
#
# @version 0.1

DESTDIR = /usr/local/share/dict
CONFIG_FILE = /etc/dict/dictd.conf
DICTNAME = wordset-dictionary
DICTNAME_FULL = "Wordset Dictionary"
DICTFILE = ${DICTNAME}_dict.txt
DOWNLOAD_DIR = data

define CONFIG
database ${DICTNAME} {
  data  ${DESTDIR}/${DICTNAME}.dict
  index ${DESTDIR}/${DICTNAME}.index
}
endef
export CONFIG

make:
	python3 wordset-dictionary-parse.py > ${DICTFILE}
	dictfmt --utf8 --allchars -s ${DICTNAME_FULL} -j ${DICTNAME} < ${DICTFILE}

download:
	mkdir ${DOWNLOAD_DIR}
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/a.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/b.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/c.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/d.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/e.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/f.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/g.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/h.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/i.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/j.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/k.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/l.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/m.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/misc.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/n.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/o.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/p.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/q.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/r.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/s.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/t.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/u.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/v.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/w.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/x.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/y.json"
	curl --output-dir ${DOWNLOAD_DIR} --remote-name "https://raw.githubusercontent.com/wordset/wordset-dictionary/master/data/z.json"

install:
	mkdir -p ${DESTDIR}
	cp -f ${DICTNAME}.dict ${DICTNAME}.index ${DESTDIR}
	@echo "Don't forget to add following to dictd config(usually ${CONFIG_FILE}) and to restart dictd."
	@echo "$$CONFIG"

uninstall:
	rm -f ${DESTDIR}/${DICTNAME}.index ${DESTDIR}/${DICTNAME}.dict

clean:
	rm -f ${DICTNAME}_dict.txt ${DICTNAME}.dict ${DICTNAME}.index

# end
