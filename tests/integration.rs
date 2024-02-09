use elastic_common_schema::ecs;

#[test]
fn contains_http_version_property() {
    assert_eq!(ecs::http::HTTP_VERSION, "http.version");
}