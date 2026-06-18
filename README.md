# vl-functions

> AutoLISP / Visual LISP utility functions by `sengdouble`

![AutoLISP](https://img.shields.io/badge/AutoLISP-Visual%20LISP-blue)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)
![Prefix](https://img.shields.io/badge/prefix-SD%3A-success)

Small, practical AutoLISP helpers for lists, point lists, Windows utilities, HTTP requests, and browser actions.

## Structure

```text
etc/            Windows and system utilities
list/           List and point-list helpers
web/            HTTP and browser helpers
```

## Functions

| Module | Functions |
| --- | --- |
| `etc/util.lsp` | `SD:generate-uuid`, `SD:get-mac-address` |
| `list/list.lsp` | `SD:assoc-value`, `SD:remove-nth` |
| `list/point.lsp` | `SD:point-p`, `SD:sort-x-descending`, `SD:sort-x-ascending`, `SD:sort-y-descending`, `SD:sort-y-ascending` |
| `web/http-get.lsp` | `SD:http-get-client`, `SD:http-get-server`, `SD:get-first-response-headers` |
| `web/website.lsp` | `SD:open-url-chrome`, `SD:open-url-shell` |

## Usage

```lisp
(load "list/point.lsp")

(SD:sort-x-descending '((3.0 0.0 0.0) (9.0 0.0 0.0) (6.0 0.0 0.0)))
; => ((9.0 0.0 0.0) (6.0 0.0 0.0) (3.0 0.0 0.0))
```

## Examples

```lisp
(SD:generate-uuid)
; => "{A679190D-F4CC-4D13-966F-C053A640DBA8}"

(SD:assoc-value "name" '(("name" "Alice") ("age" 30)))
; => "Alice"

(SD:http-get-client "https://www.naver.com")
; => "<!doctype html>..."

(SD:open-url-shell "https://www.naver.com")
; => nil
```

## Naming

All public functions use the `SD:` prefix and lower-kebab-case.

```lisp
SD:generate-uuid
SD:sort-x-descending
SD:http-get-client
```

## Notes

- Designed for AutoCAD AutoLISP / Visual LISP.
- Windows COM/WMI is used for web and system helpers.
- COM-based helpers generally return `nil` on failure.
