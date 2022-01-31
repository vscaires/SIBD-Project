INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_Portugal.svg', 'Portugal', 'PT');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/8/89/Bandera_de_Espa%C3%B1a.svg', 'Spain', 'ES');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_France.svg', 'France', 'FR');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg', 'Germany', 'DE');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_England.svg', 'England', 'EN');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_Italy.svg', 'Italy', 'IT');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/b/bc/Flag_of_Finland.svg', 'Finland', 'FI');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_Angola.svg', 'Angola', 'AG');
INSERT INTO country VALUES ('https://upload.wikimedia.org/wikipedia/commons/a/af/Flag_of_South_Africa.svggermany', 'South Africa', 'ZA');


START TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;
    INSERT INTO location VALUES ('Setúbal', 38.524400, -8.8882000, 'PT');
    INSERT INTO port VALUES (38.524400,-8.8882000);
    INSERT INTO location VALUES ('Faro', 37.0154, -7.93511, 'PT');
    INSERT INTO port VALUES ( 37.0154, -7.93511);
    INSERT INTO location VALUES ('Barcelona', 41.3887900, 2.1589900, 'ES');
    INSERT INTO wharf VALUES (41.3887900, 2.1589900);
    INSERT INTO location VALUES ('Elands Bay', -32.3154402, 18.3238333, 'ZA');
    INSERT INTO port VALUES (-32.3154402, 18.3238333);
    INSERT INTO location VALUES ('Norden', 53.5825924, 7.111653, 'DE');
    INSERT INTO wharf VALUES (53.5825924, 7.111653);
    INSERT INTO location VALUES ('Helsinque', 60.1098678, 24.7385118, 'FI');
    INSERT INTO port VALUES (60.1098678, 24.7385118);
    INSERT INTO location VALUES ('Luanda', -8.8535258, 13.2140643, 'AG');
    INSERT INTO marina VALUES (-8.8535258, 13.2140643);
    INSERT INTO location VALUES ('Las Palmas', 28.150000, -15.416667, 'ES');
    INSERT INTO port VALUES (28.150000, -15.416667);
    INSERT INTO location VALUES ('Marseille', 43.296398, 5.370000, 'FR');
    INSERT INTO port VALUES (43.296398, 5.370000);
    INSERT INTO location VALUES ('Hamburg', 53.551086, 9.993682, 'DE');
    INSERT INTO port VALUES (53.551086, 9.993682);
    INSERT INTO location VALUES ('Trieste', 33.8972632, 35.5116098, 'IT');
    INSERT INTO port VALUES (33.8972632, 35.5116098);
COMMIT; -- trigger will be fired here


INSERT INTO person VALUES ('91708072', 'Marco Pereira', 'PT');
INSERT INTO person VALUES ('95135726', 'João Rendeiro', 'PT');
INSERT INTO person VALUES ('94121345', 'Margarida Costa', 'PT');
INSERT INTO person VALUES ('12346123', 'Pablo Lopez', 'ES');
INSERT INTO person VALUES ('87342859', 'Camila Morales', 'ES');
INSERT INTO person VALUES ('18920346', 'Mateo De León', 'ES');
INSERT INTO person VALUES ('32458655', 'Alessandro Rossi', 'IT');
INSERT INTO person VALUES ('95135726', 'Giovanna Ricci', 'IT');
INSERT INTO person VALUES ('12348955', 'Lukas Müller', 'DE');
INSERT INTO person VALUES ('91708072', 'Fin Fischer', 'DE');
INSERT INTO person VALUES ('32457699', 'Elias Wagner', 'DE');
INSERT INTO person VALUES ('97687234', 'Monika Schneider', 'DE');
INSERT INTO person VALUES ('52345234', 'Brad Smith', 'EN');
INSERT INTO person VALUES ('12344563', 'Charlotte Wilson', 'EN');
INSERT INTO person VALUES ('94121345', 'Arthur Laurent', 'FR');
INSERT INTO person VALUES ('25304859', 'Maria Rendeiro','PT');
INSERT INTO person VALUES ('59988057', 'Mateus Silva','PT');
INSERT INTO person VALUES ('16048472', 'Jonas Müller','DE');
INSERT INTO person VALUES ('88574130', 'Francesco Kilt','ZA');

INSERT INTO sailor VALUES ('91708072', 'PT');
INSERT INTO sailor VALUES ('95135726', 'PT');
INSERT INTO sailor VALUES ('94121345', 'PT');
INSERT INTO sailor VALUES ('12346123', 'ES');
INSERT INTO sailor VALUES ('32458655', 'IT');
INSERT INTO sailor VALUES ('95135726', 'IT');
INSERT INTO sailor VALUES ('12348955', 'DE');
INSERT INTO sailor VALUES ('91708072', 'DE');
INSERT INTO sailor VALUES ('32457699', 'DE');
INSERT INTO sailor VALUES ('52345234', 'EN');
INSERT INTO sailor VALUES ('12344563', 'EN');
INSERT INTO sailor VALUES ('94121345', 'FR');

INSERT INTO owner VALUES ('91708072', 'PT', '21-10-1969');
INSERT INTO owner VALUES ('12346123', 'ES', '01-03-1999');
INSERT INTO owner VALUES ('87342859', 'ES', '06-05-1970');
INSERT INTO owner VALUES ('18920346', 'ES', '14-02-1993');
INSERT INTO owner VALUES ('32458655', 'IT', '01-12-1995');
INSERT INTO owner VALUES ('95135726', 'IT', '15-01-2000');
INSERT INTO owner VALUES ('12348955', 'DE', '19-05-1985');
INSERT INTO owner VALUES ('91708072', 'DE', '26-06-1987');
INSERT INTO owner VALUES ('32457699', 'DE', '30-03-1980');
INSERT INTO owner VALUES ('52345234', 'EN', '10-01-1998');
INSERT INTO owner VALUES ( '95135726','PT', '26-07-1985');
INSERT INTO owner VALUES ( '25304859','PT', '12-03-1980');
INSERT INTO owner VALUES ( '59988057','PT', '16-06-1976');
INSERT INTO owner VALUES ( '16048472','DE', '29-01-1987');
INSERT INTO owner VALUES ( '88574130','ZA', '12-06-1965');

INSERT INTO boat VALUES ('Pescada', '1999', '123455', 'PT', '91708072', 'PT');
INSERT INTO boat VALUES ('Trindade', '2015', '34256f', 'ES','91708072', 'PT');
INSERT INTO boat VALUES ('Caires', '2020', '12h34b', 'PT','12346123', 'ES');
INSERT INTO boat VALUES ('Febra', '2014', '23kj4n', 'FR', '87342859', 'ES');
INSERT INTO boat VALUES ('Camarao', '1990', '324jk5', 'FR','18920346', 'ES');
INSERT INTO boat VALUES ('Robalo', '2017', 'jh5474', 'DE', '32458655', 'IT');
INSERT INTO boat VALUES ('Rendeiro', '2019', '123k4n', 'DE','95135726', 'IT');
INSERT INTO boat VALUES ('Alga', '2019', '456jkn', 'DE','12348955', 'DE');
INSERT INTO boat VALUES ('Atum', '1995', '9as0d8', 'DE','91708072', 'DE');
INSERT INTO boat VALUES ('Bacalhau', '2002', '8s9df7', 'PT', '32457699', 'DE');
INSERT INTO boat VALUES ('Enguia', '2007', 'erty78', 'PT','52345234', 'EN');
INSERT INTO boat VALUES( 'Trindade', 2012, '79df646c690', 'PT', '91708072', 'PT');
INSERT INTO boat VALUES( 'Peixe-Espada', 2011, '79df646c650', 'PT', '91708072', 'PT');
INSERT INTO boat VALUES( 'Caires', 2014, '16e1981rg71', 'FI', '59988057', 'PT');
INSERT INTO boat VALUES( 'Febra', 2010, 'l2341r1769f', 'AG', '16048472', 'DE');
INSERT INTO boat VALUES( 'Dourado', 2020, '5x49s275f01', 'ZA', '25304859', 'PT');
INSERT INTO boat VALUES( 'Tubarao-branco', 2019, '391c850w48f', 'ZA', '59988057', 'PT');
INSERT INTO boat VALUES( 'Crustaceo', 2019, '789qwe456rt', 'ZA', '95135726', 'PT');
INSERT INTO boat VALUES( 'Titanic', 2021, '5930ck93k293', 'ES', '16048472', 'DE');
INSERT INTO boat VALUES( 'Tubarao-tigre', 2014, '5930ololoa12', 'FI', '88574130', 'ZA');
INSERT INTO boat VALUES( 'Sereia', 2011, 'T5930ALLAL12', 'ZA', '88574130', 'ZA');
INSERT INTO boat VALUES( 'Golfinho', 2009, 'T5930maria12', 'DE', '88574130', 'ZA');

INSERT INTO schedule VALUES ('01-01-2022', '31-01-2022');
INSERT INTO schedule VALUES ('15-01-2019', '31-01-2019');
INSERT INTO schedule VALUES ('01-02-2022', '14-02-2022');
INSERT INTO schedule VALUES ('01-01-2020', '14-02-2020');
INSERT INTO schedule VALUES ('14-02-2021', '28-02-2021');
INSERT INTO schedule VALUES ('14-03-2022', '28-03-2022');


INSERT INTO reservation VALUES ('123455', 'PT', '91708072', 'PT', '01-01-2022', '31-01-2022');
INSERT INTO trip VALUES ('01-01-2022','10', '123455', 'PT', '91708072', 'PT', '01-01-2022', '31-01-2022', 33.8972632, 35.5116098, 53.551086, 9.993682);
INSERT INTO trip VALUES ('11-01-2022','4', '123455', 'PT', '91708072', 'PT', '01-01-2022', '31-01-2022', 53.551086, 9.993682, 43.296398, 5.370000);
INSERT INTO trip VALUES ('16-01-2022','14', '123455', 'PT', '91708072', 'PT', '01-01-2022', '31-01-2022', 43.296398, 5.370000, 33.8972632, 35.5116098);

INSERT INTO reservation VALUES ('34256f', 'ES', '32457699', 'DE', '01-01-2022', '31-01-2022');
INSERT INTO trip VALUES ('01-01-2022','10', '34256f', 'ES', '32457699', 'DE', '01-01-2022', '31-01-2022', 33.8972632, 35.5116098, 53.551086, 9.993682);
INSERT INTO trip VALUES ('11-01-2022','4', '34256f', 'ES', '32457699', 'DE', '01-01-2022', '31-01-2022', 53.551086, 9.993682, 43.296398, 5.370000);
INSERT INTO trip VALUES ('16-01-2022','14', '34256f', 'ES', '32457699', 'DE', '01-01-2022', '31-01-2022', 43.296398, 5.370000, 33.8972632, 35.5116098);

INSERT INTO reservation VALUES ('12h34b', 'PT', '95135726', 'IT', '01-01-2022', '31-01-2022');
INSERT INTO trip VALUES ('01-01-2022','10', '12h34b', 'PT', '95135726', 'IT', '01-01-2022', '31-01-2022', 33.8972632, 35.5116098, 53.551086, 9.993682);
INSERT INTO trip VALUES ('11-01-2022','4', '12h34b', 'PT', '95135726', 'IT', '01-01-2022', '31-01-2022', 53.551086, 9.993682, 43.296398, 5.370000);
INSERT INTO trip VALUES ('16-01-2022','14', '12h34b', 'PT', '95135726', 'IT', '01-01-2022', '31-01-2022', 43.296398, 5.370000, 33.8972632, 35.5116098);

INSERT INTO reservation VALUES ('jh5474', 'DE', '91708072', 'DE', '01-01-2022', '31-01-2022');
INSERT INTO trip VALUES ('01-01-2022','10', 'jh5474', 'DE', '91708072', 'DE', '01-01-2022', '31-01-2022', 33.8972632, 35.5116098, 53.551086, 9.993682);
INSERT INTO trip VALUES ('11-01-2022','4', 'jh5474', 'DE', '91708072', 'DE', '01-01-2022', '31-01-2022', 53.551086, 9.993682, 43.296398, 5.370000);
INSERT INTO trip VALUES ('16-01-2022','14', 'jh5474', 'DE', '91708072', 'DE', '01-01-2022', '31-01-2022', 43.296398, 5.370000, 33.8972632, 35.5116098);

INSERT INTO reservation VALUES ('34256f', 'ES', '32457699', 'DE', '15-01-2019', '31-01-2019');
INSERT INTO trip VALUES ('15-01-2019', '3', '34256f', 'ES', '32457699', 'DE', '15-01-2019', '31-01-2019', 38.524400,-8.8882000, 37.0154, -7.93511);
INSERT INTO trip VALUES ('20-01-2019', '10', '34256f', 'ES', '32457699', 'DE', '15-01-2019', '31-01-2019', 37.0154, -7.93511, 38.524400,-8.8882000);

INSERT INTO reservation VALUES ('34256f', 'ES', '32457699', 'DE', '01-02-2022', '14-02-2022');
INSERT INTO trip VALUES ('01-02-2022', '5', '34256f', 'ES', '32457699', 'DE', '01-02-2022', '14-02-2022', 38.524400,-8.8882000, 37.0154, -7.93511);
INSERT INTO trip VALUES ('08-02-2022', '1', '34256f', 'ES', '32457699', 'DE', '01-02-2022', '14-02-2022', 37.0154, -7.93511, 38.524400,-8.8882000);


INSERT INTO reservation VALUES ('34256f', 'ES', '12346123', 'ES', '01-01-2020', '14-02-2020');
INSERT INTO trip VALUES ('01-01-2020','5' ,'34256f', 'ES', '12346123', 'ES', '01-01-2020', '14-02-2020', 38.524400,-8.8882000, 37.0154, -7.93511);
INSERT INTO trip VALUES ('07-01-2020','3' ,'34256f', 'ES', '12346123', 'ES', '01-01-2020', '14-02-2020', 37.0154, -7.93511, 38.524400,-8.8882000);

INSERT INTO reservation VALUES ('34256f', 'ES', '95135726', 'IT', '14-02-2021', '28-02-2021');
INSERT INTO reservation VALUES ('34256f', 'ES', '95135726', 'IT', '14-03-2022', '28-03-2022');
INSERT INTO reservation VALUES ('12h34b', 'PT', '95135726', 'IT','15-01-2019', '31-01-2019');
INSERT INTO reservation VALUES ('12h34b', 'PT', '12346123', 'ES','01-02-2022', '14-02-2022');
INSERT INTO reservation VALUES ('23kj4n', 'FR', '91708072', 'PT', '01-01-2020', '14-02-2020');
INSERT INTO reservation VALUES ('23kj4n', 'FR', '91708072', 'PT', '14-02-2021', '28-02-2021');
INSERT INTO reservation VALUES ('23kj4n', 'FR', '12346123', 'ES', '14-03-2022', '28-03-2022');
INSERT INTO reservation VALUES ('jh5474', 'DE', '91708072', 'DE', '15-01-2019', '31-01-2019');
INSERT INTO reservation VALUES ('8s9df7', 'PT', '91708072', 'DE', '01-02-2022', '14-02-2022');
INSERT INTO reservation VALUES ('8s9df7', 'PT', '91708072', 'DE', '01-01-2020', '14-02-2020');
INSERT INTO reservation VALUES ('8s9df7', 'PT', '91708072', 'DE', '14-02-2021', '28-02-2021');
INSERT INTO reservation VALUES ('8s9df7', 'PT', '91708072', 'PT', '14-03-2022', '28-03-2022');