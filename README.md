# vlq: functions

> AutoLISP / Visual LISP utility functions by `sengdouble`

![AutoLISP](https://img.shields.io/badge/AutoLISP-Visual%20LISP-blue)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)
![Prefix](https://img.shields.io/badge/prefix-vlq%3A-success)

Small, practical AutoLISP helpers for lists, point lists, Windows utilities, HTTP requests, and browser actions.

`vlq` stands for Visual LISP Quick utilities.

This library is useful for AutoCAD users and CAD automation developers who need small, reusable Visual LISP functions for everyday drawing and scripting workflows.

## Structure

```text
etc/            Windows and system utilities
list/           List and point-list helpers
web/            HTTP and browser helpers
```

## Functions

### `etc/util.lsp`

- `vlq:generate-uuid`
- `vlq:get-datetime-stamp`
- `vlq:get-mac-address`

### `list/list.lsp`

- `vlq:assoc-value`
- `vlq:insert-nth`
- `vlq:remove-nth`
- `vlq:remove-duplicates`

### `list/point.lsp`

- `vlq:point-p`
- `vlq:point-centroid`
- `vlq:sort-x-descending`
- `vlq:sort-x-ascending`
- `vlq:sort-y-descending`
- `vlq:sort-y-ascending`

### `web/http-get.lsp`

- `vlq:http-get-client`
- `vlq:http-get-server`
- `vlq:http-get-status-code`
- `vlq:get-first-response-headers`

### `web/website.lsp`

- `vlq:open-url-chrome`
- `vlq:open-url-edge`
- `vlq:open-url-edge-inprivate`
- `vlq:open-url-shell`


## Notes

- Designed for AutoCAD AutoLISP / Visual LISP.
- Windows COM/WMI is used for web and system helpers.
- COM-based helpers generally return `nil` on failure.
