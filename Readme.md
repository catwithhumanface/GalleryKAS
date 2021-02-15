
# ABOUT PROJECT
#### [ GalleryKAS ] Développement Site Web : Site de Gallery ART, Recommandation d'exhibitions, Forum de partage expériences <br><span style="font-size:15px">*( 2020.07.01 ~ 2020.07.08 )*</span>

## 1. Membres de l'équipe

|*Members*|*Contact*|
|:---:|---|
|**Joohyun ANN**|[![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white)](http://github.com/catwithhumanface) [![Gmail Badge](https://img.shields.io/badge/-annjh11@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:annjh11@gmail.com)](mailto:annjh11@gmail.com)|
|**Jihee SEO**|[![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white)](https://github.com/OngSil) [![Gmail Badge](https://img.shields.io/badge/-ehdrhelr@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:ehdrhelr@gmail.com)](mailto:ehdrhelr@gmail.com)|
|**Hyungsub Kim**|[![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white)](https://github.com/ehdrhelr) [![Gmail Badge](https://img.shields.io/badge/-ehdrhelr@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:ehdrhelr@gmail.com)](mailto:ehdrhelr@gmail.com)|

## 2. Installation du projet
1. Copier Code Github 
2. Connexion Apache Tomcat ( v9.0 ) 
3. Import Projet
4. Connexion DB ORACLE Server
   1. Exécution SQL (src/main/webapp/WEB-INF/views/sql/)
      1. create.sql
      2. insert.sql
   2. Adapation de Paramètres
      1. root-context.xml
        1. jdbcUrl
        2. username
        3. password
      2. package : GalleyKAS.setting.Path
        1. path pour UploadFiles
6. Exécution du Tomcat Server
   
## 3. Présentation du projet
&nbsp; Afin de pratiquer **MVC Pattern**, trois développeurs ont réalisé un site de Gallery d'Art pendant une semaine. **Listes des exhibitions recommndées**, ainsi qu'un **forum de discussion** pour partager l'expériences des expositions présentées sont à disposition.<br>

## 4. Technologie 
![tech](md_imgs/tech.png)
# Results
## 1. Résultat
### *Main Page*
  
![MainPage1](md_imgs/main1.PNG)
![MainPage2](md_imgs/main2.PNG)
![MainPage3](md_imgs/main3.PNG)
<br>
&nbsp;Présentation des deux services que l'on offre ; **Recommandation d'exhibitions**, **Forum**

---

### *Artists*
![ArtistsPage](md_imgs/artists.PNG)
<br>
&nbsp; Liste des noms d'artists que l'on recommande sont à disposition. Lors que l'on touche le nom d'artiste, le poster de l'artiste s'affiche à droite grâce à javascript(jquery). <br><br>


### *Review*
![Review](md_imgs/review.PNG)
<br>
&nbsp; Un forum de discussion permet de discuter les expériences sur les expositions présentées. <br><br>

---

### *Search*

![Review](md_imgs/review.PNG)
<br>
&nbsp; Le bar de recherche permet de trouver facilement une exhibition que l'on cherche. <br><br>

---


### *About*
![About](md_imgs/about.PNG)
<br>
&nbsp;La page About présente de quoi s'agit le projet, et les informations complémentaires.

---

