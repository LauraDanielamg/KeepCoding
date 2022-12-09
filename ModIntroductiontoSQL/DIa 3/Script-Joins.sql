-- inner Join ----


select b.nombre , a.num_temporada , a.anio
from prueba_ddl.temporadas a, prueba_ddl.series b
where
--joins
a.idserie  = b.idserie

--filters
and a.anio  > 2000


-- sql select join formato 2

select b.nombre , a.num_temporada , a.anio
from prueba_ddl.temporadas a inner join  prueba_ddl.series b on a.idserie  = b.idserie




select * from prueba_ddl.series

--- añadimos una nueva serie
insert into prueba_ddl.series
(idserie, nombre, year_create)
values('0005','Los Simpsom',1991);


--right join  (outer join) se usan cuando una tabla de la join con otra puedo o no tener dato.

select b.nombre , a.num_temporada , a.anio
from prueba_ddl.temporadas a right join  prueba_ddl.series b on a.idserie  = b.idserie




--son iguales

select b.nombre , a.num_temporada , a.anio
from prueba_ddl.temporadas a right join  prueba_ddl.series b on a.idserie  = b.idserie ;


select a.nombre , b.num_temporada , b.anio
from prueba_ddl.series a left join  prueba_ddl.temporadas b on a.idserie  = b.idserie ;


--SQL God Mode

select a.nombre , b.num_temporada , b.anio
from prueba_ddl.series a left join  prueba_ddl.temporadas b on a.idserie  = b.titulo  ;




-- Ejercicio 1

select a.id_person , a.dt_hire , a.job , b."name" || ' ' || b.apell1 || ' ' || b.apelli2
from public.employees a inner join public.person b on a.id_person  = b.id_person
where a.department = 'MOBILE'
