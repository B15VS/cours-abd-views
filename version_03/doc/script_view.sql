Create View User (email, motdepasse, type_user)
As
Select email, motdepasse, 'ChefDep' as type_user From ChefDepartement
Union
Select email, motdepasse, 'Etudiant' as type_user From Etudiant;
