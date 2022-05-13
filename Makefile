
GH		:= git@github.com:szycha76
PFX		:= homework-43
SUFFIXLIST	:= repoA repoC pipelines
REPOLIST	:= $(foreach sfx,$(SUFFIXLIST),$(PFX)-$(sfx))


help: 
	@grep -E ": .*[#]{2}" Makefile | sed 's/:.*[#]\{2\}/\t\t/'

clone-them-all: $(REPOLIST) $(PFX) ## Clone the repositories

homework%:
	@git clone $(GH)/$@

first-time-init: clone-them-all ## One-off action to init the workspace
	@mv Makefile $(PFX); cd $(PFX); echo '*~' > .gitignore; echo '*.sw[a-p]' >> .gitignore; git add .; git commit -m 'first-time-init'; git push -u origin master

.PHONY: clone-them-all first-time-init
