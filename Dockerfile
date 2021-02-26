FROM mickare/cargo-spellcheck:latest

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["--cfg", ".config/spellcheck.toml", "--code", "1"]