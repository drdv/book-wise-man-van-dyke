fn=book

.PHONY: all
all:
	git log -1 --pretty='format:%cd (%h)' --date=format:'%Y-%m-%d %H:%M:%S' > .version
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
	open build/the-other-wise-man.pdf

.PHONY: clean
clean:
	rm -rf build
	rm -rf .version
