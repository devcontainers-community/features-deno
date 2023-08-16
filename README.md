# Deno Dev Container Feature

🦕 Installs Deno

<p align=center>
  <img width=400 src="https://github.com/devcontainers-community/features-deno/assets/61068799/186150b5-e332-4b27-b4df-3ea0b7ae76a9">
</p>

## Usage

```jsonc
// devcontainer.json
{
  "features": {
    "ghcr.io/devcontainers-community/features/deno": {}
  }
}
```

❓ Don't know what this ☝ means? Check out [this VS Code blog post].

### Options

- **`version`:** Specify a specific Deno version to install. Must be a full
  version specifier like `30.0.0` or `latest`. Default is `latest`.

<!-- prettier-ignore -->
[this vs code blog post]: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
