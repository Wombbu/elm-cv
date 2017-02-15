# Wrapper of elm-css build command. Needed because elm-live does not allow
# pre-build command arguments at the moment
elm-css src/StyleSheets.elm
cp data/cv-data.json dist/cv-data.json
