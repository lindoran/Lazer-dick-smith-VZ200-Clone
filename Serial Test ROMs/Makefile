SUBDIRS := $(filter-out .,$(wildcard */))

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	@if [ -f $@/Makefile ]; then \
		$(MAKE) -C $@; \
	else \
		echo "Skipping $@ (no Makefile)"; \
	fi

clean:
	for dir in $(SUBDIRS); do \
		if [ -f $$dir/Makefile ]; then \
			$(MAKE) -C $$dir clean; \
	else \
		echo "Skipping $$dir (no Makefile)"; \
	fi \
	done
