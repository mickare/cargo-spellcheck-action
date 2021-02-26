# Github Action Cargo-Spellcheck

This is a Github CI Action for [drahnr/cargo-spellcheck](https://github.com/drahnr/cargo-spellcheck) with hunspell (en_US).

It forwards the command arguments to `cargo spellcheck <<args>>`.

## Usage

The action default uses a config at `.config/spellcheck.toml` (`--cfg`) and fails with exit code 1 (`-m`).
```yml
    - name: Cargo-Spellcheck
      uses: mickare/cargo-spellcheck-action
```

It is possible to pass custom arguments to spellcheck by defining them in the [`with.args` field](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstepswithargs).


```yml
    - name: Cargo-Spellcheck
      uses: mickare/cargo-spellcheck-action
      with:
        args: --help
```

```yml
    - name: Cargo-Spellcheck
      uses: mickare/cargo-spellcheck-action
      with:
        args: --cfg .config/my_spellcheck.toml --code 13
```

## Workflow Example
```yml
name: Spellcheck

on: push

jobs:
  spellcheck:
    name: Spellcheck
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: mickare/cargo-spellcheck-action@v0.0.2
        with:
          args: --cfg .config/spellcheck.toml --code 1

```