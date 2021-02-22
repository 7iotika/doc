# Tarantool Documentation

Tarantool documentation source, published at https://www.tarantool.io/doc/.

## How to build Tarantool documentation using [Docker](https://www.docker.com)

### Build the Docker image

```bash
docker build -t tarantool-doc-builder .
```

### Build Tarantool documentation in Docker

1.  First, update the submodules:

    ```bash
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "./pull_submodules.sh"
    ```
    
    You can also do without a Docker container:
    
    ```bash
    git submodule update --init
    git fetch --recurse-submodules
    git submodule update --remote --checkout
    ```
   
    **Caution:** Run this command only if you don't have untracked files!
    Check it with `git status`.
   
    Failures during `git submodule update` can be fixed with:

        ```bash
        git submodule deinit -f .
        git submodule update --init
        ```

2.  Now build the submodules content:

    ```bash
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "./build_submodules.sh"
    
    ```
    
    Init `make` commands:
    ```bash
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "cmake ."
    ```

3.  Run the required `make` command in a *tarantool-doc-builder* container:
    
    ```bash
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make html"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make html-ru"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make singlehtml"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make singlehtml-ru"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make pdf"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make pdf-ru"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make json"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make json-ru"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make epub"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make epub-ru"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make update-pot"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make update-po"
    docker run --rm -it -v $(pwd):/doc tarantool-doc-builder sh -c "make update-po-force"
    ```

### Run documentation locally on your machine
using python3 built-in server:
```bash
cd output/html
python3 -m http.server
```
or python2 built-in server:
```bash
cd output/html
python -m SimpleHTTPServer
```
then go to [localhost:8000](http://localhost:8000) in your browser.

## Localization

Terms:

* **translation unit** (TU) is an atomic piece of text which can be translated.
  A paragraph, a list item, a heading, image's alt-text and so on.
  
* **translation source files** are the files with translation units in English only.
    They're located in `locale/en`.

* **translation files** are the files which match original text to translated text.
  They're located in `locale/ru`.

Upload translation sources any time when they have changed:

```bash
crowdin upload 
# or
crowdin upload sources
```

Upload translation files once for each project, to pass the existing translations to Crowdin:

```bash
crowdin upload translations --auto-approve-imported --import-eq-suggestions
```

Download translations files back when they're done:

```bash
crowdin download
```
## How to contribute

To contribute to documentation, use the
[REST](http://docutils.sourceforge.net/docs/user/rst/quickstart.html)
format for drafting and submit your updates as a
[pull request](https://help.github.com/articles/creating-a-pull-request)
via GitHub.

To comply with the writing and formatting style, use the
[guidelines](https://www.tarantool.io/en/doc/2.2/dev_guide/documentation_guidelines/)
provided in the documentation, common sense and existing documents.

Notes:

* If you suggest creating a new documentation section (a whole new
  page), it has to be saved to the relevant section at GitHub.

* If you want to contribute to localizing this documentation (for example into
  Russian), add your translation strings to `.po` files stored in the
  corresponding locale directory (for example `/locale/ru/LC_MESSAGES/`
  for Russian). See more about localizing with Sphinx at
  http://www.sphinx-doc.org/en/stable/intl.html
