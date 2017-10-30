TOPTARGETS := clean build_debug rebuild_debug build_release rebuild_release
SUBDIRS := library test_console_application

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(SUBDIRS)
