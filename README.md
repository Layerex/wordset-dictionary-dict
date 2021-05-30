# wordset-dictionary-dict

Scripts to convert wordset-dictionary to [DICT](https://en.wikipedia.org/wiki/DICT#DICT_file_format) format.

## Installation

```sh
make download
sudo make install
```

Then add following to dictd config file (usually `/etc/dict/dictd.conf`) and restart dictd.

```
database wordset-dictionary {
  data  /usr/local/share/dict/wordset-dictionary.dict
  index /usr/local/share/dict/wordset-dictionary.index
}
```
