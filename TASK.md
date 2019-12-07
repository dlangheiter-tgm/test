# GK9.3 Distributed Computing "Cloud-Datenmanagement" - Taskdescription

## Einführung
Diese Übung zeigt die Anwendung von mobilen Diensten.

## Ziele
Das Ziel dieser Übung ist eine Webanbindung zur Benutzeranmeldung umzusetzen. Dabei soll sich ein Benutzer registrieren und am System anmelden können.  
Die Kommunikation zwischen Client und Service soll mit Hilfe einer REST Schnittstelle umgesetzt werden.

## Voraussetzungen
+ Grundlagen einer höheren Programmiersprache
+ Verständnis über relationale Datenbanken und dessen Anbindung mittels ODBC oder ORM-Frameworks
+ Verständnis von Restful Webservices

## Aufgabenstellung
Es ist ein Webservice zu implementieren, welches eine einfache Benutzerverwaltung implementiert. Dabei soll die Webapplikation mit den Endpunkten /register und /login erreichbar sein.  

### Registrierung
Diese soll mit einem Namen, einer eMail-Adresse als BenutzerID und einem Passwort erfolgen. Dabei soll noch auf keine besonderen Sicherheitsmerkmale Wert gelegt werden. Bei einer erfolgreichen Registrierung (alle Elemente entsprechend eingegeben) wird der Benutzer in eine Datebanktabelle abgelegt.

### Login
Der Benutzer soll sich mit seiner ID und seinem Passwort entsprechend authentifizieren können. Bei einem erfolgreichen Login soll eine einfache Willkommensnachricht angezeigt werden.

Die erfolgreiche Implementierung soll mit entsprechenden Testfällen (Acceptance-Tests bez. aller funktionaler Anforderungen mittels Unit-Tests) dokumentiert werden. Verwenden Sie auf jeden Fall ein gängiges Build-Management-Tool (z.B. Gradle). Dabei ist zu beachten, dass ein einfaches Deployment möglich ist (auch Datenbank mit z.B. file-based DBMS).

## Bewertung
Gruppengrösse: 1 Person
### Anforderungen "überwiegend erfüllt"
+ Dokumentation und Beschreibung der angewendeten Schnittstelle
+ Aufsetzen einer Webservice-Schnittstelle
+ Registrierung von Benutzern mit entsprechender Persistierung

### Anforderungen "zur Gänze erfüllt"
+ Login und Rückgabe einer Willkommensnachricht
+ Überprüfung der funktionalen Anforderungen mittels Regressionstests

### Classroom Repository
[Hier](https://github.com/500) finden Sie das Abgabe-Repository zum Entwickeln und Commiten Ihrer Lösung.

## Quellen
* Android Restful Webservice Tutorial – Introduction to RESTful webservice – Part 1"; Posted By Android Guru on May 1, 2014; [online](http://programmerguru.com/android-tutorial/android-restful-webservice-tutorial-part-1/)
* Registration and Login Example with Spring Boot, Spring Security, Spring Data JPA, and HSQL"; Giau Ngo; 5.7.2016; [online](https://hellokoding.com/registration-and-login-example-with-spring-security-spring-boot-spring-data-jpa-hsql-jsp/)
* "Getting Started with Couchbase and Spring Data Couchbase"; Posted by Josh Long on March 16, 2015; [online](https://spring.io/blog/2015/03/16/getting-started-with-couchbase-and-spring-data-couchbase)
* "REST with Java (JAX-RS) using Jersey - Tutorial"; Lars Vogel; Version 2.7; 27.09.2017; [online](http://www.vogella.com/tutorials/REST/article.html)
* "Creating a 'hello world' RESTful web service with Spring."; Spring examples; [online](https://github.com/spring-guides/gs-rest-service)
* "Django REST framework"; Tom Christie; [online](http://www.django-rest-framework.org/)
* "Eve. The Simple Way to REST"; Nicola Iarocci; [online](http://python-eve.org/)
* "Heroku makes it easy to deploy and scale Java apps in the cloud"; [online](https://www.heroku.com)

