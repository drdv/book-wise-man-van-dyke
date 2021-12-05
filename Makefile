fn=book
BUILD_DIR=build

.PHONY: all
all:
	git log -1 --pretty='format:%cd (%h)' --date=format:'%Y-%m-%d %H:%M:%S' > .version
	mkdir -p ${BUILD_DIR}
	tectonic $(fn).tex -o ${BUILD_DIR}
	mv ${BUILD_DIR}/$(fn).pdf ${BUILD_DIR}/the-other-wise-man.pdf
	cp pics/front.jpg ${BUILD_DIR}
	cp html/index.html ${BUILD_DIR}
	cp html/jemdoc.css ${BUILD_DIR}

.PHONY: generate_page
generate_page:
	cd html && make

.PHONY: open
open:
	open ${BUILD_DIR}/the-other-wise-man.pdf

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
	rm -rf .version
