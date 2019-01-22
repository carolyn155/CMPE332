
CREATE DATABASE ConferenceDatabase; /*create the database*/

CREATE TABLE Attendees (
    PersonID int, /*do I need this?  */
    FirstName varchar(20),
    LastName varchar(20),
    AttendeeType varchar(20)  
);

CREATE TABLE AttendeeTypes (
    AttendeeType varchar(20),
    AttendanceCost smallmoney
);

CREATE TABLE ScheduleInformation (
    NameOfSession varchar(20),
    NamesOfSpeakers varchar(20), /*how do you do multiple names?*/ 
    StartTime time(),
    EndTime time(),
    RoomLocation varchar(20)
);

CREATE TABLE SponsorLevels (
    SponsorLevel varchar(20), /*One of Platinum, Gold, Silver, Bronze*/
    FinancialSupport smallmoney, 
    EmailsAllowed int
);

CREATE TABLE Sponsors (
    CompanyName varchar(20),
    SponsorLevel varchar(20), 
    EmailsSent int /*to keep track of the number of emails each sponsor has sent out*/
);

CREATE TABLE SponsorJobAdds ( 
    CompanyName varchar(20),
    JobTitle varchar(20),
    PayRatePerYear varchar(20),
    LocationCity varchar(20),
    LocationProvince varchar(20)
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