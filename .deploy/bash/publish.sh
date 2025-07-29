#!/bin/bash -x

echo "Building the package"
python3 -m build

echo "Publishing to GitLab PyPI"
python3 -m twine upload \
  --repository-url ${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/pypi \
  --username gitlab-ci-token \
  --password ${CI_JOB_TOKEN} \
  dist/*
