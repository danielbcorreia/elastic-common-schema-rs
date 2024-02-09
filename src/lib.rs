pub mod ecs;

#[cfg(test)]
mod tests {
    use crate::ecs;

    #[test]
    fn contains_ecs_version_property() {
        assert_eq!(ecs::ECS_VERSION, "ecs.version");
    }
}
