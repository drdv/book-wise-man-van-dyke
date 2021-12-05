fn=book

.PHONY: all
all: generate_page
	mkdir -p build
	tectonic $(fn).tex -o build
	mv build/$(fn).pdf build/the-other-wise-man.pdf
	cp pics/front.jpg build
	cp html/index.html build
	cp html/jemdoc.css build

.PHONY: generate_page
generate_page:
	cd html && make

.PHONY: open
open:
	open $(fn).pdf

.PHONY: clean
clean:
	rm -rf build
