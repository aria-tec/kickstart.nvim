; extends

; Inject TSX syntax highlighting for inline import statements in MDX/Markdown
((inline) @injection.content
 (#lua-match? @injection.content "^%s*import")
 (#set! injection.language "tsx"))

; Inject TSX syntax highlighting for inline export statements in MDX/Markdown
((inline) @injection.content
 (#lua-match? @injection.content "^%s*export")
 (#set! injection.language "tsx"))
