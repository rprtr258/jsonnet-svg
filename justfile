watch-christmas:
  reflex -r '\.jsonnet$' -- jsonnet --string --multi . christmas.jsonnet

watch-heart:
  reflex -r '\.jsonnet$' -- jsonnet --string --multi . heart.jsonnet

watch-hex:
  reflex -r '\.jsonnet$' -- jsonnet --string --multi . hex.jsonnet

watch-index:
  reflex -r '\.jsonnet$' -- jsonnet --string --multi . index.jsonnet
