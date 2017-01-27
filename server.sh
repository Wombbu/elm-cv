elm-live \
  --port=8000 \
  --dir=dist \
  --before-build="./css-gen.sh" \
  --open \
  --output dist/App.js \
  --debug \
  src/App.elm
