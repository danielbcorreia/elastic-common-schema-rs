# Elastic Common Schema for Rust

This crate provides a set of constants generated from the [Elastic Common Schema](https://github.com/elastic/ecs/tree/main) (ECS) for use in Rust projects.

These constants are separated into modules based on the ECS fieldset.

## Usage

Add this crate to your `Cargo.toml`. Note that the version is indexed to the ECS version:

```toml
[dependencies]
elastic-common-schema = "1.10.0"
```

Then use the constants as you wish:

```rust
use elastic_common_schema::ecs;

fn main() {
    println!("{}", ecs::http::HTTP_VERSION);
}
```
