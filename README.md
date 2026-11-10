# FASTA Sequence Analysis — original P7 script

This repository contains a transcription of the `analyze_sequences.sh` script shown in the P7 section of the supplied Shell Scripting activity PDF.

## What the script does

- Iterates over five files named `secuencia1.fasta` to `secuencia5.fasta`.
- Reads the FASTA header and joins sequence lines.
- Reports sequence length, first and last nucleotide, and GC percentage.
- Counts the `GGGG` and `TTCC` motifs.
- Prints a display-only substitution of `GGGG` with `Mutation`.

## Project layout

```text
fasta-sequence-analysis/
├── code/
│   └── analyze_sequences.sh
└── data/
    └── processed/
        ├── secuencia1.fasta
        ├── secuencia2.fasta
        ├── secuencia3.fasta
        ├── secuencia4.fasta
        └── secuencia5.fasta
```

## Run on macOS

The script uses Bash and the `bc` command. Open Terminal, move into the project directory, then run:

```bash
cd code
chmod u+x analyze_sequences.sh
./analyze_sequences.sh
```

If `bc` is unavailable, install it with Homebrew (`brew install bc`).

## Important note about the input files

The five FASTA files included here are **illustrative demo sequences** so the script can be tested immediately. They are not represented as the original data from the academic assignment. Replace them with the original five FASTA files if you still have them and are allowed to publish them.

## Provenance

The script is transcribed from the P7 code shown in the user's academic PDF. Minor formatting/typographic normalization has been applied so it can run as a `.sh` file. Review it against the PDF before presenting it as a verbatim copy.
