ifeq ($(OS),Windows_NT)
	TARGET ?= ./bin/Main.exe
	RM = del
    
    TARGETOS ?= windows
    
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
	TARGET ?= ./bin/Main
	RM = rm -f
    
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
    	TARGETOS ?= linux
    endif
    ifeq ($(UNAME_S),Darwin)
    	TARGETOS ?= osx
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

INCDIR ?= include
SRCDIR ?= src
OBJDIR ?= obj

CC ?= gcc

CLFLAGS ?= -I$(INCDIR)
CCFLAGS ?= -Wall

ifeq ($(TARGETOS),windows)
	CCFLAGS += -D WIN32
endif
ifeq ($(TARGETOS),linux)
	CCFLAGS += -D LINUX
endif
ifeq ($(TARGETOS),osx)
	CCFLAGS += -D OSX
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

LDFLAGS ?= -Llib
LDLIBS  ?= -lm

$(info Target is "$(TARGET)")

empty =
space = $(empty) $(empty)
escspace = $(empty)\ $(empty)
ESCTARGET = $(subst $(space),$(escspace),$(TARGET))

SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

debug: $(ESCTARGET)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CLFLAGS) $(CCFLAGS) -c $< -o "$@"

$(ESCTARGET): $(OBJS)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o "$@"

clean:
	$(RM) $(OBJS)
