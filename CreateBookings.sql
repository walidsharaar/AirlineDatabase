-- Table: public.bookings

-- DROP TABLE IF EXISTS public.bookings;

CREATE TABLE IF NOT EXISTS public.bookings
(
    book_ref character(6) COLLATE pg_catalog."default" NOT NULL,
    book_date timestamp with time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    CONSTRAINT bookings_pkey PRIMARY KEY (book_ref)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.bookings
    OWNER to postgres;

COMMENT ON TABLE public.bookings
    IS 'Bookings';

COMMENT ON COLUMN public.bookings.book_ref
    IS 'Booking number';

COMMENT ON COLUMN public.bookings.book_date
    IS 'Booking date';

COMMENT ON COLUMN public.bookings.total_amount
    IS 'Total booking cost';