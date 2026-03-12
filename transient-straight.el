;;; transient-straight.el --- Transient interface for straight.el -*- lexical-binding: t; -*-

;; Author: Nícolas Morazotti <nicolas.morazotti@gmail.com>
;; Maintainer: Nícolas Morazotti <nicolas.morazotti@gmail.com>
;; Keywords: maintenance, package, tools
;; Package-Requires: ((emacs "26.1") (transient "0.3.0") (straight "0.1"))
;; URL: https://github.com/morazotti/transient-straight

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A transient interface for the straight.el package manager.

;;; Code:

(require 'transient)
(require 'straight)

(defun transient-straight-update-package ()
  "Interactively select and update a package."
  (interactive)
  (let ((pkg (straight--select-package "Select package to update:")))
    (straight-fetch-package pkg)
    (straight-pull-package pkg)
    (straight-rebuild-package pkg)))

(defun transient-straight-visit-package-magit ()
  "Interactively select a package and open its Magit status."
  (interactive)
  (let ((pkg (straight--select-package "Select package:")))
    (straight-visit-package pkg)
    (magit-status)))

;;;###autoload
(transient-define-prefix transient-straight ()
  "Interactive dashboard and unified dispatch menu for `straight'."
  [:description
   "Straight"
   [""
    ("i" "Install..." straight-use-package)
    ("u" "Update..." transient-straight-update-package)]
   [""
    ("f" "Fetch" transient-straight-fetch-dispatch)
    ("l" "Pull" transient-straight-pull-dispatch)
    ("p" "Push" transient-straight-push-dispatch)]
   [""
    ("c" "Check" transient-straight-check-dispatch)
    ("m" "Merge" transient-straight-merge-dispatch)
    ("r" "Rebuild" transient-straight-rebuild-dispatch)]
   [""
    ("v" "Version Control" transient-straight-vc-dispatch)
    ("w" "Watcher..." transient-straight-watcher-dispatch)
    ("o" "Other..." transient-straight-other-dispatch)]])

(transient-define-prefix transient-straight-check-dispatch ()
  "Perform checks on packages using `straight'."
  [:description
   "Straight > Check"
   [""
    ("p" "Package..." straight-check-package)
    ("a" "All packages" straight-check-all)]])

(transient-define-prefix transient-straight-merge-dispatch ()
  "Merge packages with their sources using `straight'."
  [:description
   "Straight > Merge"
   [""
    ("p" "Package..." straight-merge-package)
    ("d" "Package and dependencies..." straight-merge-package-and-deps)
    ("a" "All packages" straight-merge-all)]])

(transient-define-prefix transient-straight-fetch-dispatch ()
  "Fetch updates for packages using `straight'."
  [:description
   "Straight > Fetch"
   [""
    ("p" "Package..." straight-fetch-package)
    ("d" "Package and dependencies..." straight-fetch-package-and-deps)
    ("a" "All packages" straight-fetch-all)]])

(transient-define-prefix transient-straight-pull-dispatch ()
  "Pull updates for packages using `straight'."
  [:description
   "Straight > Pull"
   [""
    ("p" "Package..." straight-pull-package)
    ("d" "Package and dependencies..." straight-pull-package-and-deps)
    ("l" "Recipe repositories" straight-pull-recipe-repositories)
    ("a" "All packages" straight-pull-all)]])

(transient-define-prefix transient-straight-push-dispatch ()
  "Push changes to package sources using `straight'."
  [:description
   "Straight > Push"
   [""
    ("p" "Package..." straight-push-package)
    ("a" "All packages" straight-push-all)]])

(transient-define-prefix transient-straight-rebuild-dispatch ()
  "Rebuild packages using `straight'."
  [:description
   "Straight > Rebuild"
   [""
    ("p" "Package..." straight-rebuild-package)
    ("a" "All packages" straight-rebuild-all)]])

(transient-define-prefix transient-straight-vc-dispatch ()
  "Manage versions of packages using `straight'."
  [:description
   "Straight > VC"
   [""
    ("n" "Normalize..." straight-normalize-package)
    ("N" "Normalize all packages" straight-normalize-all)
    ("z" "Freeze" straight-freeze-versions)
    ("w" "Thaw" straight-thaw-versions)]])

(transient-define-prefix transient-straight-other-dispatch ()
  "Perform other package management tasks using `straight'."
  [:description
   "Straight > Other"
   ["Maintenance"
    ("p" "Prune build" straight-prune-build)
    ("r" "Remove unused repositories" straight-remove-unused-repos)
    ("g" "Get recipe of..." straight-get-recipe)]
   ["Dependencies"
    ("d" "Dependencies of..." straight-dependencies)
    ("D" "Dependents on..." straight-dependents)]
   ["Visit"
    ("v" "Visit..." straight-visit-package)
    ("m" "Magit..." transient-straight-visit-package-magit)
    ("w" "Visit website..." straight-visit-package-website)]])

(transient-define-prefix transient-straight-watcher-dispatch ()
  "Control the package watcher using `straight'."
  [:description
   "Straight > Watcher"
   [""
    ("s" "Start watcher" straight-watcher-start)
    ("S" "Stop watcher" straight-watcher-stop)]])

(provide 'transient-straight)

;;; transient-straight.el ends here
