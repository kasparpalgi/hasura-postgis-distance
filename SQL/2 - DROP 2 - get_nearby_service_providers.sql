-- If something goes wrong then delete the old stuff before creating new
DROP FUNCTION IF EXISTS public.get_nearby_service_providers(double precision, double precision, integer);
