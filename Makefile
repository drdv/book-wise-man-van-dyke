SOURCE_FILE=book
BUILD_DIR=build
FILE_NAME=the-other-wise-man

.PHONY: all
all:
	git log -1 --pretty='format:%cd (%h)' --date=format:'%Y-%m-%d %H:%M:%S' > .version
	mkdir -p ${BUILD_DIR}
	tectonic ${SOURCE_FILE}.tex -o ${BUILD_DIR}
	mv ${BUILD_DIR}/${SOURCE_FILE}.pdf ${BUILD_DIR}/${FILE_NAME}.pdf
	cp pics/front.jpg ${BUILD_DIR}
	cp html/index.html ${BUILD_DIR}
	cp html/jemdoc.css ${BUILD_DIR}

.PHONY: epub
epub:
	pandoc ${SOURCE_FILE}.tex -s \
	-f latex \
	-t epub \
	--toc \
	--number-sections \
	--epub-cover-image pics/front.jpg \
	-o ${BUILD_DIR}/${FILE_NAME}.epub

.PHONY: html
html:
	pandoc ${SOURCE_FILE}.tex -s \
	-f latex \
	-t html \
	--toc \
	--number-sections \
	-o ${BUILD_DIR}/${FILE_NAME}.html

.PHONY: plain
plain:
	pandoc ${SOURCE_FILE}.tex -s \
	-f latex \
	-t plain \
	--toc \
	--number-sections \
	-o ${BUILD_DIR}/${FILE_NAME}.txt

.PHONY: generate_page
generate_page:
	cd html && make

.PHONY: open
open:
	open ${BUILD_DIR}/${FILE_NAME}.pdf

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
	rm -rf .version
