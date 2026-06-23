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
| `etc/util.lsp` | `SD:generate-uuid`, `SD:get-timestamp`, `SD:get-mac-address` |
| `list/list.lsp` | `SD:assoc-value`, `SD:insert-nth`, `SD:remove-nth`, `SD:remove-duplicates` |
| `list/point.lsp` | `SD:point-p`, `SD:point-centroid`, `SD:sort-x-descending`, `SD:sort-x-ascending`, `SD:sort-y-descending`, `SD:sort-y-ascending` |
| `web/http-get.lsp` | `SD:http-get-client`, `SD:http-get-server`, `SD:http-get-status-code`, `SD:get-first-response-headers` |
| `web/website.lsp` | `SD:open-url-chrome`, `SD:open-url-edge`, `SD:open-url-edge-inprivate`, `SD:open-url-shell` |

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
