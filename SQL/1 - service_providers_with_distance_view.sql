CREATE OR REPLACE VIEW "public"."service_providers_with_distance" AS
SELECT
  service_providers.id,
  service_providers.status,
  service_providers.sort,
  service_providers.date_created,
  service_providers.user_updated,
  service_providers.date_updated,
  service_providers."user",
  service_providers.services,
  service_providers.experience_desc,
  service_providers.travel_distance,
  service_providers.experience,
  service_providers.own_transport,
  service_providers.max_weight,
  service_providers.provider_description,
  service_providers.time_start,
  service_providers.time_end,
  service_providers.national_id,
  service_providers.emergency_transport,
  service_providers.geo_location,
  (0) :: double precision AS distance
FROM
  service_providers;
