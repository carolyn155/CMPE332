
CREATE DATABASE ConferenceDatabase; /*create the database*/

CREATE TABLE Attendees (
    PersonID int NOT NULL, 
    FirstName varchar(20),
    LastName varchar(20),
    AttendeeType varchar(20), 
    PRIMARY KEY (PersonID) 
);

CREATE TABLE AttendeeTypes (
    AttendeeType varchar(20),
    AttendanceCost decimal(13,2)
);

CREATE TABLE ScheduleInformation (
    NameOfSession varchar(20),
    NamesOfSpeakers varchar(20), /*how do you do multiple names?*/ 
    StartTime time(4),
    EndTime time(4),
    RoomLocation varchar(20)
);

CREATE TABLE SponsorLevels (
    SponsorLevel varchar(20) NOT NULL, /*One of Platinum, Gold, Silver, Bronze*/
    FinancialSupport decimal(13,2), 
    EmailsAllowed int, 
    FOREIGN KEY (SponsorLevel) REFERENCES Sponsors(SponsorLevel) ON DELETE SET NULL
);

CREATE TABLE Sponsors (
    CompanyName varchar(20),
    SponsorLevel varchar(20), 
    EmailsSent int /*to keep track of the number of emails each sponsor has sent out*/
    -- FOREIGN KEY (CompanyName) REFERENCES SponsorJobAdds(CompanyName)
);

CREATE TABLE SponsorJobAdds ( 
    CompanyName varchar(20),
    JobTitle varchar(20),
    PayRatePerYear varchar(20),
    LocationCity varchar(20),
    LocationProvince varchar(20), 
);

CREATE TABLE RoomingArrangements (
    StudentNames varchar(20),
    RoomNumber int,
    RoomCapacity int,
    NumberOfBeds int
);

CREATE TABLE OrganizingCommittee (
    SubCommitteeName varchar(20),
    CommitteeChair varchar(20)
);