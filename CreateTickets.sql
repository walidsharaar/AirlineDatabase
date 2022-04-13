-- Table: public.tickets

-- DROP TABLE IF EXISTS public.tickets;

CREATE TABLE IF NOT EXISTS public.tickets
(
    ticket_no character(13) COLLATE pg_catalog."default" NOT NULL,
    book_ref character(6) COLLATE pg_catalog."default" NOT NULL,
    passenger_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    passenger_name text COLLATE pg_catalog."default" NOT NULL,
    contact_data jsonb,
    CONSTRAINT tickets_pkey PRIMARY KEY (ticket_no),
    CONSTRAINT tickets_book_ref_fkey FOREIGN KEY (book_ref)
        REFERENCES public.bookings (book_ref) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tickets
    OWNER to postgres;

COMMENT ON TABLE public.tickets
    IS 'Tickets';

COMMENT ON COLUMN public.tickets.ticket_no
    IS 'Ticket number';

COMMENT ON COLUMN public.tickets.book_ref
    IS 'Booking number';

COMMENT ON COLUMN public.tickets.passenger_id
    IS 'Passenger ID';

COMMENT ON COLUMN public.tickets.passenger_name
    IS 'Passenger name';

COMMENT ON COLUMN public.tickets.contact_data
    IS 'Passenger contact information';