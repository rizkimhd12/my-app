-- Jalankan sekali di Supabase: SQL Editor > New query > tempel semua > Run.
create table if not exists public.docs (
  col text not null,
  id text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (col, id)
);

alter table public.docs enable row level security;

drop policy if exists "iqc_select" on public.docs;
drop policy if exists "iqc_insert" on public.docs;
drop policy if exists "iqc_update" on public.docs;
drop policy if exists "iqc_delete" on public.docs;

create policy "iqc_select" on public.docs for select to anon using (true);
create policy "iqc_insert" on public.docs for insert to anon with check (true);
create policy "iqc_update" on public.docs for update to anon using (true) with check (true);
create policy "iqc_delete" on public.docs for delete to anon using (true);
