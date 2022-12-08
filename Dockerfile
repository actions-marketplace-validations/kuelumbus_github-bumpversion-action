FROM python:3-alpine
LABEL maintainer="Christopher Kuenneth"
LABEL repository="https://github.com/kuelumbus/github-bumpversion-action"
LABEL homepage="https://github.com/kuelumbus/github-bumpversion-action"

# Install our pre-reqs
RUN apk add --no-cache git bash curl jq && git config --global --add safe.directory /github/workspace

# Check to make sure pip is fully upgraded
RUN pip install --no-cache-dir -U pip

# Install bumpversion from pypi - https://pypi.org/project/bumpversion/
RUN pip install --no-cache-dir bumpversion

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
