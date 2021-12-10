create database PracticaFinal

create table CatPokemon (
ClaPokemon int auto_increment,
UrlInfo varchar(1000),
NombrePokemon varchar(1000),
FechaUltimaMod datetime,
primary key (ClaPokemon)
)

select * from CatPokemon

create view CatPokemonVw
as
select ClaPokemon, NombrePokemon, UrlInfo, FechaUltimaMod from CatPokemon;

create or replace procedure PokemonSel(varClaPokemon int)
begin 
	select ClaPokemon, NombrePokemon, UrlInfo, FechaUltimaMod
	from catpokemon
	where case when varClaPokemon = -1 then ClaPokemon else varClaPokemon end;
end

create or replace procedure PokemonIU(varclapokemon int, varnombrepokemon varchar(1000), varurlinfo varchar(1000))
begin 
	if exists(select 1 from CatPokemon where ClaPokemon = varclapokemon) then
		update CatPokemon 
			set NombrePokemon = varnombrepokemon,
				UrlInfo = varurlinfo,
				FechaUltimaMod = now()
			where ClaPokemon = varclapokemon;
	else
		insert into CatPokemon(NombrePokemon, UrlInfo, FechaUltimaMod)
		select
			varnombrepokemon,
			varurlinfo,
			now();
	end if;
end
