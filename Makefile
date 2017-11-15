NAME = sergey_kozlukov_jpcs
SOURCES = $(NAME).tex $(NAME).bib jpconf11.clo jpconf.cls iopams.sty
DOCUMENTS = $(NAME).pdf authors.pdf
PUB_SOURCES = $(addprefix pub/,$(SOURCES))

ZIP_LOCAL_CONTENTS = $(DOCUMENTS) $(SOURCES)
ZIP_CONTENTS = $(ZIP_LOCAL_CONTENTS) $(DOCUMENTS) $(SOURCES) \
			  pub/$(NAME).bbl
ZIP_FLAT_CONTENTS = \
	pub/$(NAME)_flat.tex \
	pub/$(NAME)_flat.pdf \
	authors.pdf

# Local build commands
LTEX = pdflatex
LBIB = bibtex
# Deployment environment commands
PTEX = pdflatex
PBIB = bibtex
OUTENC = utf8

default: $(NAME)_local.zip

all: $(NAME).zip $(NAME)_flat.zip

pub/$(NAME).bbl: $(PUB_SOURCES)
	rm -f $@
	cd pub ; $(PTEX) $(NAME).tex
	cd pub ; $(PBIB) $(NAME)

include Makefile.rules
