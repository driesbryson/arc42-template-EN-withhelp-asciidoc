AD_FILE = arc42-template.adoc

HTML_FILE = test.html 

$(HTML_FILE): $(AD_FILE) 

asciidoctor $(AD_FILE) -o $(HTML_FILE) 