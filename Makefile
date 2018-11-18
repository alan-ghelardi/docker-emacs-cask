cask_version = 0.8.4
image = emacs:cask-$(cask_version)

build:
	@docker build --build-arg "CASK_VERSION=$(cask_version)" -t emacs:cask-$(cask_version) .

test:
	@docker run -v `pwd`:`pwd` \
		-w `pwd` \
		$(image) ./smoke-test.sh
	@echo "Done"

clean:
	@rm -f Cask

release: build test
	@git tag $(version) && git push origin $(version)
	@docker alangh/$(image)
	@make clean
	@echo "Done"
