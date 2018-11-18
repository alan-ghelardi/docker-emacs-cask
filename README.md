# docker-emacs-cask

Docker image containing Emacs (nox) and Cask for continuous integration
processes

[Emacs][emacs] is an extensible, customizable, free/libre text editor maintained
by the GNU project. [Cask][cask] is a project management tool for Emacs Lisp to
automate the package development cycle; development, dependencies, testing,
building, packaging and more.

This Docker image was designed to be used in continuous integration pipelines in
order to test Emacs Lisp projects. In addition to `Emacs` and `Cask`, it has all
tools required by [CircleCI][circleci] to be used as a primary container in a
CircleCI's job. For more details, refer to the topic [Using Custom-Built Docker
Images](https://circleci.com/docs/2.0/custom-images/) in the CircleCI's
documentation.

Also, it comes with [OpenJDK8](openjdk) and [Leiningen](leiningen) 2.8.1 to be
used in integration tests of `Clojure` tools related to [Cider][cider].

## License

Copyright 2019 Alan Ghelardi Distributed under the GNU General Public License,
version 3

[cask]: https://cask.readthedocs.io/en/latest/
[cider]: https://github.com/clojure-emacs/cider
[circleci]: https://circleci.com/docs/2.0/
[emacs]: https://www.gnu.org/software/emacs/
[leiningen]: https://leiningen.org/
[openjdk]: https://openjdk.java.net/
