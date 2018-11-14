GCR  ?= glib-compile-resources

GXML ?= $(wildcard *.xml)
GSRC ?= $(GXML:%.xml=%.c)
GHDR ?= $(GXML:%.xml=%.h)

ifeq ($(OS),Windows_NT)
	FIXPATH = $(subst /,\,$1)
	RM = $(shell del "$(call FIXPATH,$1)")
else
	FIXPATH = $(subst \,/,$1)
	RM = $(shell rm -f "$(call FIXPATH,$1)")
endif

build: $(GXML) $(GSRC) $(GHDR)

$(GSRC): $(GXML)
	$(GCR) --sourcedir=. --generate-source --target="$@" "$<"

$(GHDR): $(GXML)
	$(GCR) --sourcedir=. --generate-header --target="$@" "$<"

clean:

	$(foreach RF,$(GSRC),$(call RM,$(RF)))
	$(foreach RF,$(GHDR),$(call RM,$(RF)))
