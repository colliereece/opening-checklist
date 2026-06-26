update locations set name = 'Opry',       slug = 'opry'        where sort_order = 1;
update locations set name = 'Colony',      slug = 'colony'      where sort_order = 2;
update locations set name = 'MOA',         slug = 'moa'         where sort_order = 3;
update locations set name = 'SF',          slug = 'sf'          where sort_order = 4;
update locations set name = 'Houston',     slug = 'houston'     where sort_order = 5;
update locations set name = 'Oakbrook',    slug = 'oakbrook'    where sort_order = 6;
update locations set name = 'PF',          slug = 'pf'          where sort_order = 7;
update locations set name = 'DC',          slug = 'dc'          where sort_order = 8;
update locations set name = 'LV',          slug = 'lv'          where sort_order = 9;
update locations set name = 'NJ',          slug = 'nj'          where sort_order = 10;
update locations set name = 'HI',          slug = 'hi'          where sort_order = 11;
update locations set name = 'SL',          slug = 'sl'          where sort_order = 12;
update locations set name = 'SJ',          slug = 'sj'          where sort_order = 13;
update locations set name = 'STL SC',      slug = 'stl-sc'      where sort_order = 14;
update locations set name = 'STL DWTN',    slug = 'stl-dwtn'    where sort_order = 15;
update locations set name = 'NYC',         slug = 'nyc'         where sort_order = 16;
update locations set name = 'AREA15',      slug = 'area15'      where sort_order = 17;
update locations set name = 'Murray',      slug = 'murray'      where sort_order = 18;
update locations set name = 'Birmingham',  slug = 'birmingham'  where sort_order = 19;
update locations set name = 'Orlando',     slug = 'orlando'     where sort_order = 20;
update locations set name = 'Schaumburg',  slug = 'schaumburg'  where sort_order = 21;
update locations set name = 'Atlanta',     slug = 'atlanta'     where sort_order = 22;
update locations set name = 'Hanover',     slug = 'hanover'     where sort_order = 23;
update locations set name = 'PCB',         slug = 'pcb'         where sort_order = 24;

-- 25th location (one more than originally seeded)
insert into locations (name, slug, sort_order)
values ('Topanga', 'topanga', 25)
on conflict (slug) do nothing;
