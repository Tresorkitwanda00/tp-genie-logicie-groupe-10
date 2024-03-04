--Insert or Update etudiant
create procedure sp_insert_etudiant
	@matricule int,@nom varchar(50),@postnom varchar(50),
	@prenom varchar(50),@sexe varchar(1)
as
begin
	if not exists(select * from etudiant where matricule=matricule)
		insert into etudiant(matricule,nom,postnom,prenom,sexe) values 
		(@matricule,@nom,@postnom,@prenom,@sexe)
	else
		update etudiant set nom=@nom,postnom=@postnom,prenom=@prenom,
		sexe=@sexe where matricule=@matricule
end
go

--Delete etudiant
create procedure sp_delete_etudiant
	@matricule int
as
begin
	if exists(select * from etudiant where matricule=@matricule)
		delete from etudiant where matricule=@matricule
end
go

--Select all etudiant
create procedure sp_select_etudiants
as
begin 
	select matricule,nom,postnom,prenom,sexe from etudiant order by nom asc
end
go

--Select one etudiant
create procedure sp_select_etudiant
	@matricule int
as
begin
	select matricule,nom,postnom,prenom,sexe from etudiant 
	where matricule=@matricule
end
go

--Insert or Update telephone
create procedure sp_insert_telephone
	@id int,@id_proprietaire int,@initial varchar(4),
	@numero varchar(9)
as
begin
	if not exists(select * from telephone where id=@id)
		insert into telephone(id,id_proprietaire,initial,numero) values 
		(@id,@id_proprietaire,@initial,@numero)
	else
		update telephone set id_proprietaire=@id_proprietaire,
		initial=@initial,numero=@numero where id=@id
end
go

--Delete telephone
create procedure sp_delete_telephone
	@id int
as
begin
	if exists(select * from telephone where id=@id)
		delete from telephone where id=@id
end
go

--Select all telephone
create procedure sp_select_telephones
as
begin
	select id,id_proprietaire,initial,numero from telephone order by numero asc
end
go

--Select all telephone of etudiant
create procedure sp_select_telephones_etudiant
	@id_etudiant int	
as
begin
	select id,id_proprietaire,initial,numero
	from telephone where id_proprietaire=@id_etudiant
	order by numero asc
end
go

--Select one telephone
create procedure sp_select_telephone
	@id int
as
begin
	select id,id_proprietaire,initial,numero from telephone
	where id=@id
end
go

--Stored Procedure for report of persons
create procedure sp_liste_etudiants
as
begin
	select etudiant.matricule,etudiant.nom + ' ' + ISNULL(etudiant.postnom,'') + ' ' + ISNULL(etudiant.prenom,'') as nom,
	etudiant.sexe,telephone.id as idtel,telephone.initial + telephone.numero as numero
	from etudiant
	left outer join telephone 
	on etudiant.matricule=telephone.id_proprietaire
end
go

--Test Insert and Update
exec sp_insert_etudiant 1,'Ushindi','Muno','Nathan','M'
exec sp_insert_etudiant 2,'Mataba','Kyole','Stephanie','F'
exec sp_insert_etudiant 3,'Arakandi','sefu','Eva','M'
select * from etudiant

exec sp_insert_telephone 1,1,'+250','785623146'
exec sp_insert_telephone 2,1,'+243','850001263'
exec sp_insert_telephone 3,2,'+243','985645235'
exec sp_insert_telephone 4,3,'+243','815790584'
exec sp_insert_telephone 5,3,'+242','808256231'
select * from telephone

--Test delete
--exec sp_delete_telephone 1
--select * from telephone

--exec sp_delete_etudiant 3
--select * from etudiant

--Test Select all
exec sp_select_etudiants

exec sp_select_etudiants

--Test Select One
exec sp_select_etudiant 3

exec sp_select_telephone 4

exec sp_select_telephones_etudiant 2

--Test Select report
exec sp_liste_etudiants

