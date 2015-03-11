{
  "name": "$NAME",
  "version": "0.0.1",
  "description": "$DESC",
  "scripts": {
    "test": "coffee test/*.coffee | tap-spec",
    "docs": "docker -i src -o apidocs -s -n -c vs",
    "compile": "coffee -c -o lib src",
    "clean": "rm -r apidocs lib ; true",
    "prepublish": "npm run compile"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/$REPO"
  },
  "author": "kba",
  "license": "MIT",
  "bugs": {
    "url": "https://github.com/$REPO/issues"
  },
  "homepage": "https://github.com/$REPO",
  "dependencies": {
    "async": "^0.9.0",
    "merge": "^1.2.0"
  },
  "devDependencies": {
    "coffee-script": "^1.9.1",
    "docker": "^0.2.14",
    "tap-spec": "^2.2.2",
    "tapes": "^0.4.1"
  },
  "main": "lib/index.js"
}
