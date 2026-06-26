-- Locations
create table if not exists locations (
  id serial primary key,
  name text not null,
  slug text not null unique,
  active boolean default true,
  sort_order integer default 0,
  created_at timestamptz default now()
);

-- Tasks (shared across all locations)
create table if not exists tasks (
  id serial primary key,
  name text not null,
  order_index integer not null default 0,
  active boolean default true,
  created_at timestamptz default now()
);

-- One submission record per location per day
create table if not exists submissions (
  id serial primary key,
  location_id integer references locations(id) not null,
  date date not null default current_date,
  completed boolean default false,
  completed_at timestamptz,
  total_tasks integer default 0,
  completed_count integer default 0,
  created_at timestamptz default now(),
  unique(location_id, date)
);

-- Individual task check-offs within a submission
create table if not exists submission_tasks (
  id serial primary key,
  submission_id integer references submissions(id) on delete cascade,
  task_id integer references tasks(id),
  task_name text not null,
  completed boolean default false,
  completed_at timestamptz,
  created_at timestamptz default now()
);

-- RLS: open policies for internal tool (anon key access)
alter table locations enable row level security;
alter table tasks enable row level security;
alter table submissions enable row level security;
alter table submission_tasks enable row level security;

create policy "public_locations" on locations for all using (true) with check (true);
create policy "public_tasks" on tasks for all using (true) with check (true);
create policy "public_submissions" on submissions for all using (true) with check (true);
create policy "public_submission_tasks" on submission_tasks for all using (true) with check (true);

-- Seed locations (update names to match your actual GBGS locations)
insert into locations (name, slug, sort_order) values
  ('Location 01', 'location-01', 1),
  ('Location 02', 'location-02', 2),
  ('Location 03', 'location-03', 3),
  ('Location 04', 'location-04', 4),
  ('Location 05', 'location-05', 5),
  ('Location 06', 'location-06', 6),
  ('Location 07', 'location-07', 7),
  ('Location 08', 'location-08', 8),
  ('Location 09', 'location-09', 9),
  ('Location 10', 'location-10', 10),
  ('Location 11', 'location-11', 11),
  ('Location 12', 'location-12', 12),
  ('Location 13', 'location-13', 13),
  ('Location 14', 'location-14', 14),
  ('Location 15', 'location-15', 15),
  ('Location 16', 'location-16', 16),
  ('Location 17', 'location-17', 17),
  ('Location 18', 'location-18', 18),
  ('Location 19', 'location-19', 19),
  ('Location 20', 'location-20', 20),
  ('Location 21', 'location-21', 21),
  ('Location 22', 'location-22', 22),
  ('Location 23', 'location-23', 23),
  ('Location 24', 'location-24', 24)
on conflict do nothing;

-- Seed tasks
insert into tasks (name, order_index) values
  ('Count Cash', 1),
  ('Turn on and test both studios', 2),
  ('Check that bathrooms are clean', 3),
  ('Check for confetti', 4),
  ('Turn lobby lights on', 5),
  ('Check Xola/DGP', 6),
  ('Plan breaks', 7)
on conflict do nothing;
