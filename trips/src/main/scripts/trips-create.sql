create sequence hibernate_sequence minvalue 100;

    create table Location (
        id int4 primary key,
        address varchar(255) not null,
        lat float8 not null,
        lon float8 not null,
        name varchar(32) not null,
        notes varchar(64) not null,
        location_type varchar(8) not null
    );

    create table Route (
        id int4 primary key,
        travelMethod varchar(8),
        fromLocation_id int4,
        toLocation_id int4,
        trip_id int4
    );

    create table Trip (
        id int4 primary key,
        defaultTravelMethod varchar(10),
        name varchar(255) not null,
        startTime date not null
    );

    create table trip_locations (
        trip_id int4 not null,
        location_id int4 not null,
        step int4 not null,
        primary key (trip_id, step)
    );

    create table users (
        id int4 primary key,
        user_type varchar(31) not null,
        enabled boolean not null,
        email varchar(255),
        password varchar(255),
        client_id varchar(255) not null,
        client_secret varchar(255) not null,
        device_id varchar(255) not null
    );

    insert into users values(1,'ROLE_ADMIN','t','admin@gmail.com','abcd', '12345', 'abcde','98765');
    insert into users values(2,'ROLE_USER','t','john@gmail.com','abcd','24680','zyxwv','13579');

    alter table Route add constraint fk_from_location 
        foreign key (fromLocation_id) references Location;

    alter table Route add constraint fk_to_location 
        foreign key (toLocation_id) references Location;

    alter table Route add constraint fk_trip 
        foreign key (trip_id) references Trip;

    alter table trip_locations add constraint fk_trip_location_location 
        foreign key (location_id) 
        references Location;

    alter table trip_locations add constraint fk_trip_location_trip 
        foreign key (trip_id) 
        references Trip;
