GCR  ?= glib-compile-resources

GXML ?= $(wildcard ./*.xml)
GSRC ?= $(GXML:./%.xml=./%.c)
GHDR ?= $(GXML:./%.xml=./%.h)

all: $(GXML) $(GSRC) $(GHDR)

$(GSRC): $(GXML)
	$(GCR) --sourcedir=. --generate-source --target="$@" "$<"

$(GHDR): $(GXML)
	$(GCR) --sourcedir=. --generate-header --target="$@" "$<"

clean:

	$(foreach RF,$(GSRC),$(call RM,$(RF)))
	$(foreach RF,$(GHDR),$(call RM,$(RF)))
