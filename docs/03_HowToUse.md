### How to use
Generate for all type (HTML, Markdown and PDF).

```
make all
```

Generate for a specific type.
```
make pdf

make html

make markdown   
```

By default a simple make will generate the document in Markdown.

#### Graphics 
You can choose your own graphics with the CSS file [Header.css](header.css)

I made a simple file for me but feel free to create your own style.

#### Makefile

You can edit the makefile, you will find two variables in it.

```
SUMMARY_FILE=01_Summary.md
OUTPUT="Readme"
```

For the variable OUTPUT do not specify a type because the programme could generate differents types.

