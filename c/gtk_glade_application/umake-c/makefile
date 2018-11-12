########################################################################################################################
# CONFIG: PROJECT

APPNAME   ?= main

DBGBINDIR ?= ../bin/debug
DBGOBJDIR ?= ../obj/debug
RELBINDIR ?= ../bin/release
RELOBJDIR ?= ../obj/release

########################################################################################################################
# CONFIG: SYSTEM

ifeq ($(OS),Windows_NT)
	TARGETOS ?= windows
	APPEXT ?= .exe
	
	FIXPATH = $(subst /,\,$1)
	
	MKDIR = if not exist "$(call FIXPATH,$1)" mkdir "$(call FIXPATH,$1)"
	CAT = $(shell type "$(call FIXPATH,$1)")
	PWD = $(shell cd)
	RM = del "$(call FIXPATH,$1)"
	
	ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
		TARGETARCH ?= x86_64
	else
		ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
			TARGETARCH ?= x86_64
		endif
		ifeq ($(PROCESSOR_ARCHITECTURE),x86)
			TARGETARCH ?= x86
		endif
	endif
else
	FIXPATH = $(subst \,/,$1)
	
	MKDIR = mkdir -p "$(call FIXPATH,$1)"
	CAT = $(shell cat "$(call FIXPATH,$1)")
	PWD = $(shell pwd)
	RM = rm -f "$(call FIXPATH,$1)"
	
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		TARGETOS ?= linux
		APPEXT ?=
	endif
	
	UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		TARGETARCH ?= x86_64
	endif
	ifneq ($(filter %86,$(UNAME_P)),)
		TARGETARCH ?= x86
	endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		TARGETARCH ?= arm
	endif
endif

ifeq ($(TARGETOS),windows)
	CCFLAGS = -D WIN32
endif
ifeq ($(TARGETOS),linux)
	CCFLAGS = -D LINUX
endif

ifeq ($(TARGETARCH),x86_64)
	CCFLAGS += -D AMD64
endif
ifeq ($(TARGETARCH),x86)
	CCFLAGS += -D IA32
endif
ifeq ($(TARGETARCH),arm)
	CCFLAGS += -D ARM
endif

empty        =
space        = $(empty) $(empty)
escspace     = $(empty)\ $(empty)

########################################################################################################################
# CONFIG: PATH

SRCEXT       ?= c

MK_SOURCE    ?= "../umake-conf/mk_source.list"
MK_INCLUDE   ?= "../umake-conf/mk_include.list"
MK_PKG       ?= "../umake-conf/mk_pkg.list"
MK_PREMAKE   ?= "../umake-conf/mk_prebuild.list"
MK_POSTMAKE  ?= "../umake-conf/mk_postbuild.list"

PKGS         = $(call CAT,$(MK_PKG))

ESCSRCDIR    = $(foreach DIR,$(call CAT,$(MK_SOURCE)),$(subst $(space),$(escspace),$(DIR)))
ESCINCDIR    = $(foreach DIR,$(call CAT,$(MK_INCLUDE)),$(subst $(space),$(escspace),$(DIR)))
ESCAPPNAME   = $(subst $(space),$(escspace),$(APPNAME))$(subst $(space),$(escspace),$(APPEXT))
ESCDBGBINDIR = $(subst $(space),$(escspace),$(DBGBINDIR))
ESCDBGOBJDIR = $(subst $(space),$(escspace),$(DBGOBJDIR))
ESCRELBINDIR = $(subst $(space),$(escspace),$(RELBINDIR))
ESCRELOBJDIR = $(subst $(space),$(escspace),$(RELOBJDIR))
SRCS         = $(foreach DIR,$(ESCSRCDIR),$(wildcard $(DIR)/*.$(SRCEXT)))
VPATH        = $(sort $(dir $(SRCS)))
DBGTARGET    = $(ESCDBGBINDIR)/$(ESCAPPNAME)
DBGOBJS      = $(patsubst %.$(SRCEXT), $(ESCDBGOBJDIR)/%.o, $(notdir $(SRCS)))
RELTARGET    = $(ESCRELBINDIR)/$(ESCAPPNAME)
RELOBJS      = $(patsubst %.$(SRCEXT), $(ESCRELOBJDIR)/%.o, $(notdir $(SRCS)))

########################################################################################################################
# CONFIG: COMPILER

CC        ?= gcc

CLFLAGS   += $(foreach INCFILE,$(ESCINCDIR),-I$(INCFILE))
CCFLAGS   += -Wall -pipe

LDFLAGS   ?= -rdynamic
LDLIBS    ?=

ifneq ($(PKGS),)
CLFLAGS   += `pkg-config --cflags $(foreach PN,$(call CAT,$(MK_PKG)),$(PN))`
LDLIBS    += `pkg-config --libs $(foreach PN,$(call CAT,$(MK_PKG)),$(PN))`
endif

DBGCFLAGS = -g3 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG

########################################################################################################################
########################################################################################################################

.PHONY: clean prebuild postbuild

rebuild_debug: clean build_debug
rebuild_release: clean build_release

build_debug: prep prebuild debug postbuild
build_release: prep prebuild release postbuild

debug: prebuild

	@$(MAKE) --no-print-directory debug_target

debug_target: $(DBGTARGET)

$(ESCDBGOBJDIR)/%.o: %.$(SRCEXT)
	$(CC) $(CLFLAGS) $(DBGCFLAGS) $(CCFLAGS) -c "$<" -o "$@"

$(DBGTARGET): $(DBGOBJS)
	$(CC) $(LDFLAGS) $(DBGCFLAGS) $^ $(LDLIBS) -o "$@"
	@$(MAKE) --no-print-directory postbuild

release: prebuild

	@$(MAKE) --no-print-directory release_target

release_target:

$(ESCRELOBJDIR)/%.o: %.$(SRCEXT)
	$(CC) $(CLFLAGS) $(RELCFLAGS) $(CCFLAGS) -c "$<" -o "$@"

$(RELTARGET): $(RELOBJS)
	$(CC) $(LDFLAGS) $(RELCFLAGS) $^ $(LDLIBS) -o "$@"
	@$(MAKE) --no-print-directory postbuild

prep:

	$(call MKDIR,$(DBGBINDIR))
	$(call MKDIR,$(DBGOBJDIR))
	$(call MKDIR,$(RELBINDIR))
	$(call MKDIR,$(RELOBJDIR))

clean:

	$(call RM,$(DBGTARGET))
	$(call RM,$(ESCDBGOBJDIR)/*.o)
	$(call RM,$(RELTARGET))
	$(call RM,$(ESCRELOBJDIR)/*.o)

prebuild:

	$(foreach C,$(call CAT,$(MK_PREMAKE)),$(MAKE) -C $(C))

postbuild:

	$(foreach C,$(call CAT,$(MK_POSTMAKE)),$(MAKE) -C $(C))
