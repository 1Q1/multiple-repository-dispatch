# Trigger rebuilds by using repository dispatch events

## Usage 

```
name: My workflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
        - name: 'Repository dispatch',
          uses: 1Q1/multiple-repository-dispatch,
          with:
            token: '${{ secrets.TOKEN }}',
            user: 'john.smith@example.com',
            action: 'example-action'
            repos: |
                'org/repo'
                'org/another_repo'
```