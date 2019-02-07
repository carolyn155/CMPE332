-- create the database for the conference 
CREATE DATABASE ConferenceDatabase; 

-- type of attendee to categorize attendees 
CREATE TABLE AttendeeTypes (
    AttendeeType varchar(20) NOT NULL,
    AttendanceCost decimal(13,2) NOT NULL,
    PRIMARY KEY (AttendeeType)
);

-- attendee has an attendee type 
CREATE TABLE Attendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    AttendeeType varchar(20), -- an attendee has a type 
    PRIMARY KEY (ID),
    FOREIGN KEY (AttendeeType) REFERENCES AttendeeTypes(AttendeeType)
);

-- students may decided to stay in a room 
CREATE TABLE RoomingArrangements (
    StudentNames varchar(20), -- multi value
    RoomNumber int NOT NULL, -- PK
    RoomCapacity int NOT NULL,
    NumberOfBeds int NOT NULL,
    PRIMARY KEY (RoomNumber)
);

-- attendees that are students 
CREATE TABLE StudentAttendees (
    ID int NOT NULL, -- FK
    FirstName varchar(20) NOT NULL, -- PK
    LastName varchar(20) NOT NULL, -- PK
    RoomNumber int, -- FK
    PRIMARY KEY (FirstName, LastName), 
    FOREIGN KEY (RoomNumber) REFERENCES RoomingArrangements(RoomNumber),
    FOREIGN KEY (ID) REFERENCES Attendees(ID)
);

-- Professionals are attendees of conference 
CREATE TABLE ProfessionalAttendees (
    ID int NOT NULL, -- FK
    FirstName varchar(20),
    LastName varchar(20),
    Industry varchar(20), -- added info for fun 
    PRIMARY KEY (FirstName, LastName), 
    FOREIGN KEY (ID) REFERENCES Attendees(ID)
);

-- Speakers are attendees of conference 
CREATE TABLE SpeakerAttendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    SessionSpeakingAt varchar(20),    
    PRIMARY KEY (FirstName, LastName),
    FOREIGN KEY (ID) REFERENCES Attendees(ID)
);

-- Sponsors will have a sponsor level, ranking their sponsorship
CREATE TABLE SponsorLevels (
    SponsorLevel varchar(20) NOT NULL, -- PK, One of Platinum, Gold, Silver, Bronze
    FinancialSupport decimal(13,2), 
    EmailsAllowed int,
    PRIMARY KEY (SponsorLevel)
);

-- sponsors are allowed to have job postings 
CREATE TABLE JobPostings (      -- for sponsors to post ads for jobs 
    CompanyName varchar(20),
    JobTitle varchar(20) NOT NULL, -- PK
    PayRatePerYear varchar(20),
    City varchar(20),
    Province varchar(20), 
    PRIMARY KEY (JobTitle)
);

-- Companies can sponsor the conference 
CREATE TABLE Sponsors (
    CompanyName varchar(20) NOT NULL, -- PK
    SponsorLevel varchar(20), -- referenced from sponsor levels
    JobPostings varchar(20), -- multivalued
    EmailsSent int, -- derived from job postings to keep track of number of emails sent
    PRIMARY KEY (CompanyName),
    FOREIGN KEY (JobPostings) REFERENCES JobPostings(JobTitle)

    -- FOREIGN KEY (SponsorLevel) REFERENCES SponsorsLevels(SponsorLevel)
);

CREATE TABLE SponsorAttendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    Company varchar(20) NOT NULL,
    PRIMARY KEY (FirstName, LastName),
    FOREIGN KEY (Company) REFERENCES Sponsors(CompanyName)
);

-- speaker speaks at a session 
CREATE TABLE ScheduleInformation (
    SessionName varchar(20) NOT NULL,
    SpeakerID int NOT NULL, -- muti values 
    StartTime time(4),
    EndTime time(4),
    RoomLocation varchar(20), 
    PRIMARY KEY (SessionName),
    FOREIGN KEY (SpeakerID) REFERENCES SpeakerAttendees(ID)
    -- FOREIGN KEY (SessionName) REFERENCES SpeakerAttendees(SessionSpeakingAt)
);

CREATE TABLE OrganizingCommittee (
    SubCommitteeName varchar(20),
    Chair varchar(20),
    PRIMARY KEY (Chair)
);

CREATE TABLE CommitteeMember (
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    SubCommitteeName varchar(20), -- multiple entries 
    NumberOfCommittees int, -- derived from subcommittee name 
    PRIMARY KEY (FirstName, LastName)
    -- FOREIGN KEY (SubCommitteeName) REFERENCES OrganizingCommittee(SubCommitteeName)
);




