fn = book

.PHONY: tex
tex:
	tectonic $(fn).tex

open:
	open $(fn).pdf
