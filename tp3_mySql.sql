select * from informaticien where ville_inf='alger' or ville_inf ='oran';
select * from informaticien order by date_naissance_inf ASC;
select * from informaticien where salaire between '7000' and '9000' order by salaire desc;
select * from informaticien where ville_inf = 'oran' order by date_naissance_inf desc, salaire asc;
select * from informaticien where nom_inf like 'm%' and prenom_inf like '%e';
select avg(salaire) as salaire_moyenne from informaticien; # saliare moyenne
select avg(salaire) as salaire_moyenne from informaticien where fonction='ingenieur'; #salaire moyenne des ingénieurs
select max(salaire), min(salaire) from informaticien;
select count(fonction) from informaticien where fonction='avocat'; #le nombre des ingénieurs
select fonction, count(fonction) from informaticien group by fonction;
select fonction, count(fonction) as nombre_ingenieur,sum(salaire), avg(salaire) as moyenne_salaire from informaticien group by fonction;
select * from informaticien where salaire>(select avg(salaire) from informaticien);
select fonction,min(salaire), max(salaire) from informaticien group by fonction;
select avg(salaire) from informaticien;
select * from informaticien where fonction = 'analyste' and salaire > (select avg (salaire) from informaticien);
select nom_inf, salaire, fonction from informaticien where salaire > (select salaire from informaticien where prenom_inf='said'); # les informaticiens dont la salaire > 'said'
select nom_projet, date_debut,date_fin, nom_theme from projet, theme where projet.num_theme = theme.num_theme;
select nom_theme,count(nom_projet) from theme,projet where projet.num_theme = theme.num_theme group by projet.num_theme;
select nom_projet,nom_theme from projet, theme where projet.num_theme = theme.num_theme and  (nom_theme= 'big data' or nom_theme = 'ia');
select nom_projet,nom_theme from projet, theme where projet.num_theme = theme.num_theme and nom_theme in ('machine learning','nlp'); #  IN::une colonne est égale à une valeur OU une autre valeur
select  nom_projet, count(num_inf) from projet as p, travaille as t  where p.code_projet=t.code_projet group by t.code_projet having count(num_inf)>3;
select  nom_inf, nom_projet from informaticien , projet where informaticien.nom_inf =  travaille.num_inf and travaille.code_projet=projet.code_projet;
select nom_inf, prenom_inf, nom_projet from informaticien,projet,travaille where informaticien.num_inf = travaille.num_inf and travaille.code_projet = projet.code_projet order by nom_inf;
select  sum(salaire), nom_projet from informaticien, projet, travaille where informaticien.num_inf = travaille.num_inf and travaille.code_projet = projet.code_projet and nom_projet='les voitures concentrés';
SELECT nom_theme,sum(salaire) from  informaticien, theme, projet, travaille  where informaticien.num_inf = travaille.num_inf and travaille.code_projet = projet.code_projet and projet.num_theme = theme.num_theme and nom_theme='ia';
select * from informaticien where num_inf not in (select num_inf from travaille);
select  nom_projet, sum(salaire) from informaticien, projet,travaille where informaticien.num_inf = travaille.num_inf and travaille.code_projet = projet.code_projet group by nom_projet;
select *, datediff(date_fin, date_debut) as durée from projet order by durée;
select*, year(curdate())-year(date_naissance_inf) as àge from informaticien order by àge ; # calculer l'age
