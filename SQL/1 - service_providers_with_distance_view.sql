CREATE OR REPLACE VIEW "public"."service_providers_with_distance" AS
SELECT
  service_providers.id,
  service_providers.first_name,
  service_providers.geo_location,
  <---- ALL THE OTHER FIELDS I HAVE IN THE TABLE ---->
  (0) :: double precision AS distance
FROM
  service_providers;