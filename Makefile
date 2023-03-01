# AsciiDoc Makefile

# Set the name of your AsciiDoc file without the file extension
FILENAME = Makefile

# Set the output format for the document (e.g., html5, docbook, pdf)
FORMAT = asciidoctor

# Set any additional options for the asciidoctor command
OPTIONS =

# Set the command to generate the output file
ifeq ($(FORMAT),html5)
	OUTPUT_CMD = asciidoctor -b html5 -o $(FILENAME).html $(OPTIONS) $(FILENAME).adoc
else ifeq ($(FORMAT),docbook)
	OUTPUT_CMD = asciidoctor -b docbook -o $(FILENAME).xml $(OPTIONS) $(FILENAME).adoc
else ifeq ($(FORMAT),pdf)
	OUTPUT_CMD = asciidoctor-pdf $(FILENAME).adoc
else
	$(error "Invalid output format: $(FORMAT)")
endif

.PHONY: all clean

all: $(FILENAME).$(FORMAT)

$(FILENAME).$(FORMAT): $(FILENAME).adoc
	$(OUTPUT_CMD)

clean:
	rm -f $(FILENAME).html $(FILENAME).xml $(FILENAME).pdf
