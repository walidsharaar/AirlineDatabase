-- Table: public.airports

-- DROP TABLE IF EXISTS public.airports;

CREATE TABLE IF NOT EXISTS public.airports
(
    airport_code character(3) COLLATE pg_catalog."default" NOT NULL,
    airport_name jsonb NOT NULL,
    city jsonb NOT NULL,
    coordinates point NOT NULL,
    timezone text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT airports_data_pkey PRIMARY KEY (airport_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.airports
    OWNER to postgres;

COMMENT ON TABLE public.airports
    IS 'Airports (internal data)';

COMMENT ON COLUMN public.airports.airport_code
    IS 'Airport code';

COMMENT ON COLUMN public.airports.airport_name
    IS 'Airport name';

COMMENT ON COLUMN public.airports.city
    IS 'City';

COMMENT ON COLUMN public.airports.coordinates
    IS 'Airport coordinates (longitude and latitude)';

COMMENT ON COLUMN public.airports.timezone
    IS 'Airport time zone';