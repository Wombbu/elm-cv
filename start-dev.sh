elm-live \
  --port=8000 \
  --dir=dist \
  --before-build="./before-build.sh" \
  --open \
  --output dist/App.js \
  --debug \
  src/App.elm
