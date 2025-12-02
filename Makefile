.PHONY: serve build clean deps install-hugo

HUGO_VERSION ?= 0.146.0
HUGO_BIN ?= $(GOPATH)/bin/hugo

# Run local development server
serve:
	hugo server --buildDrafts --bind 0.0.0.0

# Build the static site
build:
	hugo --minify

# Clean build artifacts
clean:
	rm -rf public resources

# Install/update Hugo module dependencies
deps:
	hugo mod get -u
	hugo mod tidy

# Install Hugo extended version
install-hugo:
	CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@v$(HUGO_VERSION)
	@echo "Hugo extended installed. Verify with: hugo version"
