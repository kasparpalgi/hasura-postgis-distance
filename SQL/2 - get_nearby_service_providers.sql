CREATE OR REPLACE FUNCTION public.get_nearby_service_providers(
  lon double precision,
  lat double precision,
  max_distance integer
) RETURNS SETOF public.service_providers_with_distance LANGUAGE plpgsql STABLE AS $$
BEGIN
RETURN QUERY
SELECT
  sp.id,
  sp.status,
  sp.sort,
  sp.date_created,
  sp.user_updated,
  sp.date_updated,
  sp."user",
  sp.services,
  sp.experience_desc,
  sp.travel_distance,
  sp.experience,
  sp.own_transport,
  sp.max_weight,
  sp.provider_description,
  sp.time_start,
  sp.time_end,
  sp.national_id,
  sp.emergency_transport,
  sp.geo_location,
  ST_Distance(
    ST_SetSRID(sp.geo_location, 4326)::geography,
    ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography
  ) as distance
FROM
  public.service_providers sp
WHERE
  ST_DWithin(
    ST_SetSRID(sp.geo_location, 4326)::geography,
    ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography,
    max_distance
  )
ORDER BY
  distance;
END;
$$;
