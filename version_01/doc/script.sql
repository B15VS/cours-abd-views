Create Table Etudiant (
	id Integer Primary Key Auto_Increment,
	nom Char(100),
	prenom Char(100),
	email Char(100) Unique,
	motdepasse Char(100)
);

Create Table Formation (
	id Integer Primary Key Auto_Increment,
	intitule Char(100),
	domaine Char(100)
);

Create Table Faculte (
	id Integer Primary Key Auto_Increment,
	nom Char(100)
);

Create Table Departement (
	id Integer Primary Key Auto_Increment,
	nom Char(100),
	id_faculte Integer References Faculte(id)
);

Create Table ChefDepartement (
	id Integer Primary Key Auto_Increment,
	nom Char(100),
	prenom Char(100),
	email Char(100) Unique,
	motdepasse Char(100)
);

Create Table Inscription (
	id_etudiant Integer References Etudiant(id),
	id_formation Integer References Formation(id),
	id_departement Integer References Departement(id),
	annee_univ Integer,
	decision Char(100) Default "Inconnu",
	Constraint pk Primary Key (id_etudiant, id_formation, id_departement, annee_univ)
);

Create Table ChefDe (
	id_chefdepartement Integer References ChefDepartement(id),
	id_departement Integer References Departement(id),
	annee_univ Integer,
	Constraint pk Primary Key (id_chefdepartement, id_departement, annee_univ)
);

Insert Into Faculte Values (NULL, 'Sciences Exactes et Informatique');
Insert Into Departement Values (NULL, 'Informatique', 1);
Insert Into ChefDepartement Values (NULL, 'Benamer', 'Amer', 'exemple@jijel.com', '123');
Insert Into ChefDe Values (1, 1, 2019);

Insert Into Formation Values (NULL, 'Licence Informatique', 'Informatique');
Insert Into Formation Values (NULL, 'Licence Maths', 'Maths');
Insert Into Formation Values (NULL, 'Licence Français', 'Langues');
Insert Into Formation Values (NULL, 'Licence Anglais', 'Langues');

Insert Into Etudiant Values (NULL, 'Benahmed', 'Ahmed', 'etud@jijel.com', '456');


