-- Add location_id to tasks (null = all stores, set = specific store only)
alter table tasks add column if not exists location_id integer references locations(id) on delete cascade;

-- Allow hiding a global task from a specific location
create table if not exists task_exclusions (
  id serial primary key,
  task_id integer references tasks(id) on delete cascade,
  location_id integer references locations(id) on delete cascade,
  created_at timestamptz default now(),
  unique(task_id, location_id)
);

alter table task_exclusions enable row level security;
create policy "public_task_exclusions" on task_exclusions for all using (true) with check (true);
