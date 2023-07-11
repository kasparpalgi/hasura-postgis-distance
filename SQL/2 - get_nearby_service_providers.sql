CREATE OR REPLACE FUNCTION public.get_nearby_service_providers(
  lon double precision,
  lat double precision,
  max_distance integer
) RETURNS SETOF public.service_providers_with_distance LANGUAGE plpgsql STABLE AS $$
BEGIN
RETURN QUERY
SELECT
  sp.id,
  sp.first_name,
  sp.geo_location,
  <---- ALL THE OTHER FIELDS I HAVE IN THE TABLE ---->
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
