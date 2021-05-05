drop database if exists choose_your_church_09672023;
create database choose_your_church_09672023;
use choose_your_church_09672023;


-- fellowship table-which has the fellowship and all necessary information,strong entity
create table fellowship(
fellowship_id int,
fellowship_name longtext,
meeting_time time,
primary key(fellowship_id)
);
-- population of fellowsship
insert into fellowship values
(111, "Kingdom Christian Fellowship Ministries",'2:00:00'),
(112, "The King's Union International",'3:40:00'),
(113, "The Pentecost Students'Association",'1:45:20'),
(114, "First Love Ministries",'2:00:00'),
(115, "The Catholic Church",'1:30:00'),
(116, "The Empowerment Worship Center",'2:30:00'),
(117, "The Seventh Day Adventist",'1:20:00'),
(118, "The Latter Day Saints",'2:00:00'),
(119, "The Protestant Church",'1:00:00'),
(1110, "The Presbytarian Church",'1:00:00');

-- Awards_section weak entity,  
create table awards_section(
award_name varchar(50),
award_count int,
award_id int auto_increment,
award_type enum('Fellowship Award', 'Service Award','Ministration Award', 'Member Award', 'Curricula Award'),
fellowship_id int,
primary key(award_id),
foreign key(fellowship_id) references fellowship(fellowship_id)
on update cascade
on delete cascade 
);

-- populating awards_section table
insert into awards_section values
("Best Fellowship of the Semester",2, 211,'Fellowship Award',111),
("Best Ministrations of the Semester", 5, 212, 'Ministration Award',112),
("Best Services of the Semester", 10, 213, 'Service Award',112),
("Best Exta Curriculum  Activities of the Semester", 6, 214, 'Curricula Award',111),
("Best Members of the Semester", 25, 215, 'Member Award', 114);

-- extra_curriculum table-to track each extra curricula item,strong entity 
create table extra_curriculum(
extra_id int auto_increment,
extra_name text,
extra_type enum('media','arts','tech', 'sports'),
primary key(extra_id)
);
-- population of extra_curriculum table 
insert into extra_curriculum values
(311, "Choir Team",'arts'),
(312, "Theatre Team",'arts'),
(313, "VR Team",'tech'),
(314, "Football Team",'sports'),
(315, "Tennis Team",'sports'),
(316, "AI Team",'tech'),
(317, "Painting Team",'arts'),
(318, "Streaming Team",'tech'),
(319, "Event Planning Team",'arts'),
(3110, "Basketball Team",'sports');


-- fellowship_curriculum-check fellowship curricula, weak entity
create table fellowship_curriculum(
fellowship_id int,
extra_id int,
foreign key(fellowship_id) references fellowship(fellowship_id),
foreign key(extra_id) references extra_curriculum(extra_id)
on update cascade
on delete cascade 

);
-- populating fellowship_curriculum table 
insert into fellowship_curriculum values 
(111, 311),
(111, 312),
(111, 314),
(111, 317),
(111, 318),
(111, 319),
(112, 311),
(112, 312),
(112, 313),
(112, 314),
(112, 315),
(112, 316),
(112, 317),
(112, 318),
(113, 311),
(113, 319),
(113, 3110),
(113, 317),
(113, 318),
(114, 311),
(114, 315),
(114, 3110),
(114, 319),
(115, 311),
(115, 313),
(115, 314),
(115, 319),
(115, 316),
(116, 311),
(116, 317),
(116, 318),
(116, 319),
(117, 311),
(117, 318),
(117, 316),
(117, 314),
(118, 311),
(118, 3110),
(118, 312),
(118, 313),
(119, 311),
(119, 312),
(119, 314),
(119, 316),
(1110, 311),
(1110, 313),
(111, 316);



-- creating table for testimonies to take members testimonies, strong entity
create table testimonies(
testimony_id int primary key auto_increment,
testimony_statement longtext, -- displays what testimony the user gave 
testimony_date date -- gives date person made testimony
);

-- populating testimony table
insert into testimonies values
(411, "My mother was magically healed from cancer", '2020-01-03'),
(412, "My cousin resurrected fro the dead", '2020-01-08'),
(413, "My barren auntie gave birth to thriplets", '2020-01-25'),
(414, "I received 5000 cedis from a stranger", '2020-02-05'),
(415, "I got my dream job", '2020-02-18'),
(416, "I helped someone be free from masturbation", '2020-02-19'),
(417, "I was free from cleptomania", '2020-03-03'),
(418, "I got a ful-time scholarship to my dream school", '2020-03-15'),
(419, "God helped mebuild my house at 22 years", '2020-03-31'),
(4120, "I successfully got married to my bestfrined since 18 years and we are raising a family bred in Christ", '2020-04-01'),
(4121, "My church organized a powerful retreat and people were free from all their bondages", '2020-04-06'),
(4122, "My father was promoted to governor of the bank of Ghana", '2021-07-03'),
(4123, "My sister graduated with honours in her masters degree program", '2021-08-03');



-- Fellowship_testimony table links every testimony to its fellowship, weak entity
create table fellowship_testimony(
fellowship_id int,
testimony_id int,
foreign key (fellowship_id) references fellowship(fellowship_id),
foreign key(testimony_id) references testimonies(testimony_id)
on update cascade
on delete cascade 
);

-- population of the fellowship_testimony table 

insert into fellowship_testimony values

(111, 411),
(111, 412),
(111, 414),
(111, 417),
(111, 418),
(111, 419),
(112, 411),
(112, 412),
(112, 413),
(112, 414),
(112, 415),
(112, 416),
(112, 4120),
(112, 418),
(113, 411),
(113, 419),
(113, 4120),
(113, 417),
(113, 418),
(114, 411),
(114, 415),
(114, 4121),
(114, 419),
(115, 411),
(115, 413),
(115, 414),
(115, 419),
(115, 416),
(116, 413),
(116, 417),
(116, 418),
(116, 419),
(117, 419),
(117, 418),
(117, 416),
(117, 414),
(118, 411),
(118, 4123),
(118, 412),
(118, 413),
(119, 411),
(119, 412),
(119, 414),
(119, 416),
(1110, 411),
(1110, 413),
(111, 416);


-- service table-strong entity to track each service and their rating
create table service(
service_no int auto_increment,
service_name enum('Sunday','Midweek','Special'),
service_rating int,
primary key(service_no)
);

-- population of service table 
insert into service values
(500,'Sunday', 5),
(501,'Sunday', 3),
(502,'Sunday', 4),
(503,'Sunday', 2),
(504,'Special', 5),
(505,'Special', 4),
(506,'Special', 3),
(507,'Special', 2),
(508,'Midweek', 5),
(509,'Midweek', 4),
(5010,'Midweek', 3),
(5011, 'Midweek', 2);

-- Fellowship_service table to track each service belonging to each fellowship, weak entity
create table fellowship_service(
fellowship_id int,
service_no int,
foreign key (fellowship_id) references fellowship(fellowship_id),
foreign key(service_no) references service(service_no)
on update cascade
on delete cascade 
);

-- populating fellowship_service table 
insert into  fellowship_service values
(111, 501),
(111, 505),
(111, 5010),
(112, 502),
(112, 506),
(112, 508),
(113, 501),
(113, 507),
(113, 5011),
(114, 503),
(114, 504),
(114, 509),
(115, 503),
(115, 507),
(115, 5010),
(116, 500),
(116, 504),
(116, 507),
(117, 500),
(117, 506),
(117, 509),
(118, 501),
(118, 504),
(118, 508),
(119, 500),
(119, 504),
(119, 508),
(1110, 503),
(1110, 506),
(1110, 5011);


-- Member table-weak entity, to check members of each fellowship
create table members(
member_id int primary key,
fname varchar(30),
lname varchar(30),
dobmonth varchar(20), -- holds month of birth
dob date, -- holds actual date
email longtext,
phone_number varchar(20),
fellowship_id int,
foreign key(fellowship_id) references fellowship(fellowship_id)
on update cascade
on delete cascade 
);

-- population of members table  
insert into  members values 
(600, "Pamela", "Annang", "April",'2000-04-15', "p.annang@ashesi.edu.gh","+2335560689065",111),
(601, "Jessica", "Mills", "March", '2001-03-27', "j.mills@ashesi.edu.gh","+233265776097",112),
(602, "Samantha", "Reindorf", "January",'2001-01-03', "samantha.reindorf@ashesi.edu.gh","+2335560689099",112),
(603, "Emmanuel","Oppong", "December", '1997-12-20', "e.oppong@ashesi.edu.gh","+2335760689098",116),
(604, "Jil", "Asare", "March", '2000-03-09',"j.asare@ashesi.edu.gh","+2335564589081",112),
(605, "Gabriel", "Apio", "October",'2000-10-08', "g.appio@ashesi.edu.gh","+2332764589082",113),
(606, "Hannah", "Mbagare", "July",'1998-07-20', "h.mbagare@ashesi.edu.gh","+2449564589083",1110),
(607, "Delambi","Kasuzi","August",'1997-08-09' ,"delam.kasuzi@ashesi.edu.gh","+2448564589084",114),
(608, "Tania", "Ferguson", "December", '2000-12-29', "t.ferguson@ashesi.edu.gh","+4445564589085",115),
(609, "Ineza", "Nice", "May",'2002-05-09', "c.nice@ashesi.edu.gh","+2775564589086",117),
(6010, "Edna", "Sharp", "September", '2002-09-20' ,"e.tetteh@ashesi.edu.gh","+2332464589087",118),
(6011, "Suzette", "Zwenes", "November",'2000-11-09' ,"s.zwennes@ashesi.edu.gh","+2335964589089",119),
(6012, "Akofa", "Asare", "June", '1997-06-11', "a.asare@ashesi.edu.gh","+2332664589152",119),
(6013, "Hannibal", "Dick", "October", '2001-10-29', "h.dick@ashesi.edu.gh","+2335564576548",111),
(6014, "Kezia", "Dangote", "February",'1998-02-02', "k.dangote@ashesi.edu.gh","+2334414590040",115),
(6015, "Charles", "Duku", "February", '2002-02-02',"c.duku@ashesi.edu.gh","+2332788992021",116);


-- Member_testimony to track members testimony, weak entity
create table member_testimony(
member_id int,
testimony_id int,
foreign key (member_id) references members(member_id),
foreign key(testimony_id) references testimonies(testimony_id)
on update cascade
on delete cascade 

);

-- population of member_testimony table 
insert into member_testimony values
(601,4123),
(603,413),
(604,414),
(605,419),
(606,418),
(607,417),
(608,416),
(609,4123);
-- Member_service_rating, to pair each service and their rating, weak entity 
create table members_service_rating(
member_id int,
service_no int,
foreign key (member_id) references members(member_id),
foreign key(service_no) references service(service_no)
on update cascade
on delete cascade 
);


-- populating service_rating table 
insert into members_service_rating values
(600,501),
(6010,501),
(602,5011),
(602,5011),
(604,503),
(606,503),
(607,508),
(608,508),
(609,504),
(6010,504),
(6015,5010);


-- Alumni shows the alumni id and their graduation date, weak entity
create table alumni(
alumni_id int,
alumni_grad_date date,
member_id int,
primary key(alumni_id,member_id),
foreign key(member_id) references members(member_id)
on delete cascade 
);

-- populating alumni table 
insert into alumni values
(700,'2018-04-05',608),
(701,'2018-04-05',609),
(702,'2019-04-07',6010),
(703,'2019-04-07',6011),
(704,'2020-04-20',6012),
(705,'2020-04-20',6013),
(706,'2008-04-25',6014),
(708,'2008-04-25',6015);

-- Student shows student and its key attributes, weak entity
create table student(
student_id int,
student_status enum ('scholar','fee-paying'),
member_id int,
primary key(student_id,member_id),
foreign key(member_id) references members(member_id)
on delete cascade 
);

-- populating student table
insert into student values
(801,'scholar',600),
(802,'scholar',601),
(803,'fee-paying',602),
(804,'fee-paying',603),
(805,'fee-paying',604),
(806,'scholar',605),
(807,'scholar',606),
(808,'fee-paying',607);


-- work_section table-to check where each member works,weak entity
create table work_section(
work_id int,
company_name longtext,
work_position varchar(30),
member_id int,
primary key(work_id),
foreign key(member_id) references members(member_id)
on delete cascade 
);

-- populating work_section table
insert into work_section  values
(901, "Deloitte, Ghana","Teller",600),
 (902, "Nestle Ghana Limitted","Manager",601),
 (903, "Impuntu Technologies","Lead Researcher",602),
 (904, "Norkway","Lead Programmer",603),
 (905, "La Palm Royal Beach Hotel","Receptionist",604),
 (906, "Google","Programmer",605),
 (907, "Microsoft","Human Resource Lead",606),
 (908, "PwC, Ghana","Human Resource Personnel",607),
 (909, "Apple","Sales executive",608),
 (9010, "Carokeries Restaurant","Owner",609),
 (9011, "Adom Hospital","Owner",6010),
 (9012, "Ecobank, Ghana","Teller",6011);


-- Alumni_work shows alumni and their work, weak entity
create table alumni_work(
alumni_id int,
work_id int, 
foreign key(alumni_id) references alumni(alumni_id),
foreign key(work_id) references work_section(work_id)
on delete cascade 
);

-- populating alumni work
insert into alumni_work values
(700,907),
(701,908),
(702,909),
(703,9010),
(704,9011),
(705,9012);


-- Ministrations show the ministrations of each fellowship, strong entity
create table ministrations(
ministration_name longtext,
ministration_duration time,
ministration_id int primary key 
);

-- populating ministrations table 

insert into ministrations  values
("What is Man", '3:30:00',1011),
("The mountain top", '2:30:00',1012),
("The Mystery behind Jesus's death", '1:30:00',1013),
("Our Reigning Life", '1:30:00',1014),
("The Great White Throne", '1:45:00',1015),
("Trusting the Lord", '00:45:00',1016),
("Matters of the Heart", '1:00:00',1017),
("Loving God Pt.1", '1:20:00',1018),
("Loving God Pt.2", '1:00:00',1019),
("Judgement Pt.1", '2:20:00',10110);

-- Fellowship_ministrations(fellowship_id(fk), ministration_id(fk)) 
create table fellowship_ministrations(
ministration_id int,
fellowship_id int,
foreign key(ministration_id) references ministrations(ministration_id),
foreign key(fellowship_id) references fellowship(fellowship_id)
on update cascade
);
-- populating  fellowship_ministrations
insert into  fellowship_ministrations  values
(1011, 112),
(1012, 111),
(1013, 116),
(1014, 1110),
(1015, 118),
(1016, 115),
(1017, 112);

-- QUERIES
-- this query shows the individual first name, their last name, their work position and the fellowship they belong to
select members.fname, members.lname, work_section.work_position, fellowship.fellowship_name from members inner join fellowship on members.fellowship_id=fellowship.fellowship_id inner join work_section on work_section.member_id=members.member_id order by fellowship.fellowship_name;

-- this query shows the various fellowships, their names and the extra curricula activities they handle 
select distinct extra_curriculum.extra_name, extra_curriculum.extra_type,fellowship.fellowship_name from extra_curriculum inner join fellowship_curriculum on fellowship_curriculum.extra_id=extra_curriculum.extra_id inner join fellowship order by extra_curriculum.extra_name;

-- this query shows each fellowship and the testimonies of their members 
select  * from fellowship full join testimonies inner join members group by fname, lname;

-- this query finds the average rating of each service of each fellowship and displays the fellowship with the highest rating over a fixed service value of 3.5 
select distinct fellowship.fellowship_name, service.service_rating from service inner join members_service_rating on service.service_no=members_service_rating.service_no inner join fellowship group by service.service_no having avg(service.service_rating) >3.5;

--  this query groups members in each fellowship by their birth month to enable wishes to be sent and prayer requests to be collected for the students.  
select dob, fname, lname, dobmonth from members where dobmonth in ('February', 'March', 'April', 'May',' June', 'July', 'August', 'September', 'October', 'November', 'December') order by dobmonth;
-- extract(month from members.dob) as months, fellowship.fellowship_name, members.fname, members.lname, members.dob from members join fellowship on fellowship.fellowship_id=members.fellowship_id group by months;

-- this query places awards at the award section of each fellowship and awards the fellowship based on the count of consistency over an average to help members see the competitive nature of fellowships. 
select awards_section.award_name,awards_section.award_count, fellowship.fellowship_name from fellowship inner join awards_section on fellowship.fellowship_id=awards_section.fellowship_id;
 
-- INDEXES 
-- index 1
create index the_awards on awards_section(fellowship_id, award_name, award_count); -- to show functionality 6 of showing each fellowship, the awards they have won and the consistency of those awards

-- index 2
create index birthdays on members(fname, lname, dob, fellowship_id); -- for displaying members who have the same birthmonths and sending birthday messages to them

-- index 3
create index rate_service on service(service_no, service_rating); -- to show each service and their rating for later compilation and awards.

-- index 4
create index work_success on work_section(work_id, work_position) -- to check the success in work of members



