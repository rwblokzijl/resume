all: pdf

CVNL="./Robert Wessel Blokzijl - Curriculum Vitae - Nederlands.pdf"
CVEN="./Robert Wessel Blokzijl - Curriculum Vitae - English.pdf"

.phony: all clean pdf

run:
	evince ${CVEN} ${CVNL} > /dev/null 2>&1 &

pdf:
	pandoc -M "lang_nl" --template resume.pandoc.tex --pdf-engine=xelatex -o ${CVNL} resume.yml
	pandoc -M "lang_en" --template resume.pandoc.tex --pdf-engine=xelatex -o ${CVEN} resume.yml

# html: resume.html
# resume.html: resume.yml resume.pandoc.html ; pandoc --template resume.pandoc.html --self-contained --css resume.css -o resume.html resume.yml

# txt: resume.txt
# resume.txt: resume.yml resume.pandoc.plain ; pandoc -t plain --template resume.pandoc.plain -o resume.txt resume.yml

# md: resume.md
# resume.md: resume.yml resume.pandoc.markdown ; pandoc -t markdown  --template resume.pandoc.markdown -o resume.md resume.yml

clean: ; rm -f resume.pdf resume.html resume.txt resume.md
