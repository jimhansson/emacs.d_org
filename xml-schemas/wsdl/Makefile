#doing this might be easier on a linux machine

TRANG=trang
RNGCONV=./rngconv
SAXON=saxon-xslt

all: wsdl11-all.rnc

wsdl11-all.rnc: wsdl11-all.rng
	"$(TRANG)" $< $@
	sed -i -e 's|xmlschema.rnc|../xmlschema.rnc|' wsdl11-all.rnc
	rm xmlschema.rnc

wsdl11-all.rng: wsdl11-all.xsd
	"$(RNGCONV)" $< $@.raw
	"$(SAXON)" $@.raw wsdl11-all-process-rng.xsl > $@
	rm $@.raw
