-- Rode uma vez no SQL Editor do Supabase (https://supabase.com/dashboard)
-- Tabela: um registro por restaurante. O botão do admin só grava aqui.

create table if not exists public.abertura_manual (
  restaurante_id uuid primary key references public.restaurantes(id) on delete cascade,
  aberta boolean not null default false,
  atualizado_em timestamptz not null default now()
);

alter table public.abertura_manual enable row level security;

drop policy if exists abertura_manual_select on public.abertura_manual;
drop policy if exists abertura_manual_insert on public.abertura_manual;
drop policy if exists abertura_manual_update on public.abertura_manual;

create policy abertura_manual_select on public.abertura_manual
  for select to anon, authenticated
  using (true);

create policy abertura_manual_insert on public.abertura_manual
  for insert to anon, authenticated
  with check (true);

create policy abertura_manual_update on public.abertura_manual
  for update to anon, authenticated
  using (true)
  with check (true);

grant select, insert, update on public.abertura_manual to anon, authenticated;
