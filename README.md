[![Build Status](https://travis-ci.com/nik-sm/dotfiles.svg?branch=master)](https://travis-ci.com/nik-sm/dotfiles)

# Install

```bash
git clone https://github.com/nik-sm/dotfiles
./install
```

# Manual Test

Create image with dotfiles installed:
```
docker build -t test .
```

Run container and check things look right:
```
docker run -ti --rm test zsh
```

# Acknowledgements

Inspired by [Anish Athalye's dotfiles](https://github.com/anishathalye/dotfiles)
