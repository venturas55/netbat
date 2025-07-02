alter table usuarios add column prefmap varchar(10) default 'Leaflet'; 
alter table balizamiento add column apagada boolean default false; 
alter table balizamiento add column esBoya boolean default false; 
alter table balizamiento add column necesita_pintado tinyint(1) DEFAULT 0;
alter table localizacion add column coordenadas point default NULL;

ALTER TABLE preventivos MODIFY fecha TIMESTAMP NULL;
ALTER TABLE preventivos MODIFY solved_at TIMESTAMP NULL;
alter table preventivos add solved_by_id int(11) after solved_at;

alter table preventivos add foto_general varchar(250) after solved_at;
alter table preventivos add foto_alimentacion varchar(250) after solved_at;
alter table preventivos add foto_monitoreo varchar(250) after solved_at;
alter table preventivos add foto_linterna varchar(250) after solved_at;
alter table preventivos add foto_estructura varchar(250) after solved_at;

ALTER TABLE `usuarios` ADD CONSTRAINT `unique_email` UNIQUE (`email`);
update balizamiento set esBoya=1 where tipo like '%boya%';

alter table usuarios add column default_localizacion varchar(15) default 'valencia'; 