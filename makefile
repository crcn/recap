all:
	mesh build-src;


browserify:
  ./node_modules/.bin/browserify -e ./lib/browser/index.js -o ./lib/browser/index.min.js;

clean:
	rm -rf lib;