#!/usr/bin/env python3

import glob
import json
import sys
from typing import Callable


def end_sentence_with_dot(s: str) -> str:
    if not s[-1] in (".", "?", "!"):
        s += "."
    return s


def modify_first_letter(f: Callable[[str], str], s: str) -> str:
    return f(s[0]) + s[1:]


def main():
    files = glob.glob(f"{sys.argv[1]}/*.json")
    if not files:
        print(
            "Wordset dictionary files not found. Run make download to download those.",
            file=sys.stderr,
        )
        exit(1)
    with sys.stdout as out:
        for file_name in files:
            with open(file_name) as f:
                print(f"Processing {file_name}", file=sys.stderr)
                words = json.load(f)
                for word in words.values():
                    if "meanings" in word.keys():
                        for meaning in word["meanings"]:
                            meaning["def"] = modify_first_letter(
                                lambda s: s.lower(),
                                end_sentence_with_dot(meaning["def"].strip()),
                            )
                            out.write(
                                f':{word["word"]}:({meaning["speech_part"]}) {meaning["def"]}'
                            )
                            if "example" in meaning.keys():
                                meaning["example"] = modify_first_letter(
                                    lambda s: s.capitalize(),
                                    end_sentence_with_dot(meaning["example"].strip()),
                                )
                                out.write(f' {meaning["example"]}')
                            if "synonyms" in meaning.keys():
                                out.write(
                                    f"\nSynonyms:"
                                    f' {", ".join((synonym for synonym in meaning["synonyms"] if synonym is not None))}.'
                                )
                            out.write("\n")


if __name__ == "__main__":
    main()
