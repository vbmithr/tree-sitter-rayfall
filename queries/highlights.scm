(comment) @comment

(string) @string
(character) @character
(quoted_symbol) @string.special.symbol
(keyword) @constant

[(integer) (float) (hexadecimal)] @number
[(date) (time) (timestamp)] @number
(null) @constant.builtin
(boolean) @constant.builtin

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

":" @punctuation.delimiter

(pair key: (dictionary_key) @property)

(identifier) @variable

(call function: (identifier) @function.call)

;; Every name in Rayforce's registered builtin surface
;; (docs/docs/reference/all-functions.md) that is not a special form below.
((call
  function: (identifier) @function.builtin)
 (#any-of? @function.builtin
  "abs" "acos" "all" "and" "ann" "anti-join" "any" "apply" "as" "asc" "asin"
  "asof-join" "assert-fact" "at" "atan" "avg" "avgs" "bin" "binr" "bot"
  "ceil" "cols" "concat" "cos" "cos-dist" "count" "cov" "cross" "cut" "date"
  "datoms" "dd" "de" "deltas" "desc" "dev" "dev_pop" "dict" "differ"
  "distinct" "div" "diverse" "dl-add-edb" "dl-eval" "dl-free" "dl-program"
  "dl-provenance" "dl-query" "dl-stratify" "dow" "doy" "drop" "enlist" "env"
  "eval" "except" "exit" "exp" "fill" "fills" "filter" "find" "first" "fkeys"
  "floor" "fold" "fold-left" "fold-right" "fold-while" "format" "full-join"
  "get" "group" "guid" "hh" "hnsw-build" "hnsw-free" "hnsw-info" "hnsw-load"
  "hnsw-save" "iasc" "idesc" "in" "inner-join" "inner-prod" "key" "knn"
  "l2-dist" "lag" "last" "lead" "left-join" "like" "list" "load" "log"
  "lower" "map" "map-left" "map-right" "mavg" "max" "maxs" "mcount" "mdev"
  "med" "meta" "min" "mins" "minute" "mm" "mmax" "mmin" "mode" "modify"
  "msum" "mvar" "neg" "nil?" "norm" "not" "or" "parse" "pearson_corr"
  "percentile" "pivot" "pmap" "pow" "prds" "print" "println" "prior" "prod"
  "pull" "quantile" "query" "rand" "rank" "ratios" "raze" "rc" "read"
  "read-bytes" "read-csv" "reciprocal" "remove" "replace" "resolve"
  "retract-fact" "reverse" "rotate" "round" "row" "rule" "scan" "scan-eav"
  "scan-left" "scan-right" "scov" "sect" "ser" "show" "signum" "sin" "split"
  "sqrt" "ss" "stddev" "stddev_pop" "str-find" "str-join" "strlen" "substr"
  "sum" "sums" "sym-name" "table" "take" "tan" "til" "time" "timeit"
  "timestamp" "top" "trim" "type" "ungroup" "unify" "union" "union-all"
  "upper" "value" "var" "var_pop" "wavg" "where" "window-join" "window-join1"
  "within" "write" "write-bytes" "write-csv" "wsum" "xasc" "xbar" "xcol"
  "xcols" "xdesc" "xgroup" "xkey" "xrank" "yyyy"))

;; Dotted names under the reserved namespaces (.sys .os .ipc .csv .db ...).
((call
  function: (identifier) @function.builtin)
 (#match? @function.builtin "^[.][A-Za-z]"))

;; Special forms (unevaluated arguments), query forms, raise and return.
((call
  function: (identifier) @keyword)
 (#any-of? @keyword
  "alter" "del" "do" "fn" "if" "insert" "let" "quote" "raise" "return"
  "select" "set" "times" "try" "update" "upsert" "while" "window"))

;; Recursion reference inside (fn ...).
((identifier) @variable.builtin
 (#eq? @variable.builtin "self"))

((identifier) @operator
 (#any-of? @operator
  "+" "-" "*" "/" "%" "==" "!=" "<" "<=" ">" ">=" "&" "|"))
