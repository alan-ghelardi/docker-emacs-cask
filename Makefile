cask_version = 0.8.4
tag = cask-$(cask_version)
image = emacs:$(tag)

build:
	@docker build --build-arg "CASK_VERSION=$(cask_version)" -t $(image) .

test:
	@docker run -v `pwd`:`pwd` \
		-w `pwd` \
		$(image) ./smoke-test.sh
	@echo "Done"

clean:
	@rm -f Cask

release: build test
	@git tag $(tag) && git push origin $(tag)
	@docker push alangh/$(image)
	@make clean
	@echo "Done"
