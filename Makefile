fn = book

.PHONY: tex
tex:
	mkdir -p build
	tectonic $(fn).tex -o build

open:
	open $(fn).pdf
