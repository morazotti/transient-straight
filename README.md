# transient-straight

A [transient](https://github.com/magit/transient) interface for the [straight.el](https://github.com/radian-software/straight.el) package manager for Emacs.

## Features

- Unified dispatch menu for all common `straight.el` operations.
- Interactive package selection.
- Integration with Magit for visiting packages.
- Easy access to fetching, pulling, pushing, merging, and rebuilding packages.

## Installation

### Using straight.el

```elisp
(straight-use-package
 '(transient-straight :type git :host github :repo "morazotti/transient-straight"))
```

## Usage

Invoke the main menu with `M-x transient-straight`.

From there, you can access various sub-menus for different operations:

- **i**: Install a package
- **u**: Update a package (fetch, pull, and rebuild)
- **f**: Fetch operations
- **l**: Pull operations
- **p**: Push operations
- **c**: Check operations
- **m**: Merge operations
- **r**: Rebuild operations
- **v**: Version control (normalize, freeze, thaw)
- **w**: Watcher control
- **o**: Other operations (prune, remove unused, visit, Magit)

## License

GPLv3
