# LaTeX Templates

This repository contains custom LaTeX templates i made for various MIET document types.

## Folder Structure

- `asgienment/`: Template for assignments.
- `miniproject/`: Template for mini project reports (LaTeX).
- `project/`: Template for project reports (LaTeX).
- `seminar/`: Template for seminar reports or presentations (LaTeX).
- `synopsis/`: Official Major/Mini Project Synopsis Format (Typst).

## Usage

### LaTeX Templates
Navigate to the respective folder and compile the `template.tex` file using your preferred LaTeX compiler (e.g., `pdflatex`, `xelatex`, or `latexmk`).

For example, to compile the project template:

```bash
cd project/
latexmk -pdf template.tex
```

### Typst Templates
Navigate to the `synopsis/` folder and compile using `typst`:

```bash
cd synopsis/
typst compile template.typ
```

To watch for changes during editing:

```bash
typst watch template.typ
```
