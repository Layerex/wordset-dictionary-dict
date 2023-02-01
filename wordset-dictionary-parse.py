#!/usr/bin/env python3

import glob
import json
import sys


def main():
    files = glob.glob(f"{sys.argv[1]}/*.json")
    if not files:
        print("Wordset dictionary files not found. Run make download to download those.", file=sys.stderr)
        exit(1)
    with sys.stdout as out:
        for file_name in files:
            with open(file_name) as f:
                print(f"Processing {file_name}", file=sys.stderr)
                words = json.load(f)
                for word in words.values():
                    if "meanings" in word.keys():
                        for meaning in word["meanings"]:
                            out.write(
                                f':{word["word"]}:({meaning["speech_part"]})'
                                f' {meaning["def"]}.'
                            )
                            if "example" in meaning.keys():
                                out.write(f' {meaning["example"]}')
                            if "synonyms" in meaning.keys():
                                out.write(
                                    f" Synonyms:"
                                    f' {" ".join((synonym for synonym in meaning["synonyms"] if synonym is not None))}.'
                                )
                            out.write("\n")


if __name__ == "__main__":
    main()
