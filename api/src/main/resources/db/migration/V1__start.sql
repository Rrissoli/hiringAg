create table user_acount (
    id bigserial primary key,
    name varchar(100) NOT NULL,
    email varchar(100) Unique Not null,
    password varchar(100) not null,
    bio text,
    created_at timestamp default now(),
    updaterd_at timestamp,
    enabled boolean not null default true
);
create table client (
    id bigserial primary key,
    name varchar(100) NOT NULL,
    bio text,
    created_at timestamp default now(),
    updaterd_at timestamp
);

create table projects (
    id bigserial primary key,
    name varchar(100) NOT NULL,
    description text,
    terminated bool default false,
    background varchar(255),
    hash varchar(255) not null,
    created_at timestamp default now(),
    updaterd_at timestamp,
    owner_id bigint not null references user_acount (id),
    client_id bigint not null references client (id)
);
create table label(
    id bigserial primary key,
    name varchar(100) NOT NULL,
    color varchar(7) Not null,
    created_at timestamp default now(),
    updaterd_at timestamp
);
create table activities_list(
    id bigserial primary key,
    name varchar(100) NOT NULL,
    show_order int not null,
    backlog boolean not null default false,
    created_at timestamp default now(),
    updaterd_at timestamp,
    project_id bigint not null references projects (id)
);
create table activity(
    id bigserial primary key,
    title varchar(100) NOT NULL,
    description text,
    start_date timestamp default now(),
    dae_date timestamp,
    show_order int not null,
    backlog boolean not null default false,
    created_at timestamp default now(),
    updaterd_at timestamp,
    activities_list_id bigint not null references activities_list (id)
);
create table activities_labels(
       activity_id bigint not null references activity (id),
       label_id bigint not null references label (id),
       primary key(activity_id, label_id)
);


