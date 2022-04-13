-- Table: public.aircrafts

-- DROP TABLE IF EXISTS public.aircrafts;

CREATE TABLE IF NOT EXISTS public.aircrafts
(
    aircraft_code character(3) COLLATE pg_catalog."default" NOT NULL,
    model jsonb NOT NULL,
    range integer NOT NULL,
    CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_code),
    CONSTRAINT aircrafts_range_check CHECK (range > 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.aircrafts
    OWNER to postgres;

COMMENT ON TABLE public.aircrafts
    IS 'Aircrafts (internal data)';

COMMENT ON COLUMN public.aircrafts.aircraft_code
    IS 'Aircraft code, IATA';

COMMENT ON COLUMN public.aircrafts.model
    IS 'Aircraft model';

COMMENT ON COLUMN public.aircrafts.range
    IS 'Maximal flying distance, km';