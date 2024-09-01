CREATE TABLE Users (
    UserId INTEGER PRIMARY KEY AUTOINCREMENT,
    Username TEXT,
    Firstname TEXT,
    Lastname TEXT,
    Password TEXT,
    DateOfBirth REAL,
    Dateadded TEXT DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Friends (
    FriendId INTEGER PRIMARY KEY AUTOINCREMENT,
    FriendWhoAdded INTEGER,            
    FriendBeingAdded INTEGER,          
    IsAccepted INTEGER DEFAULT 0,      
    Dateadded TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FriendWhoAdded) REFERENCES Users(UserId),
    FOREIGN KEY (FriendBeingAdded) REFERENCES Users(UserId)
);


CREATE TABLE Groups (
    GroupId INTEGER PRIMARY KEY AUTOINCREMENT,
    Groupname TEXT NOT NULL,
    CreatedBy INTEGER,
    Dateadded TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserId)
);

CREATE TABLE Posts (
    PostId INTEGER PRIMARY KEY AUTOINCREMENT,
    PostDescription TEXT NOT NULL,
    PostedBy INTEGER,
    IsPublic INTEGER,
    IsOnlyForGroup INTEGER,
    IsOnlyForFriends INTEGER,
    GroupId INTEGER,
    DatePosted TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserId),
    FOREIGN KEY (GroupId) REFERENCES Groups(GroupId)
);


CREATE TABLE Groupmembershiprequest (
    GroupmembershipRequestID INTEGER PRIMARY KEY AUTOINCREMENT,
    GroupId INTEGER,
    GroupMemberUserId INTEGER,
    IsgroupmembershipisAccepted INTEGER DEFAULT 0,
    DateAccepted TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupId) REFERENCES Groups(GroupId),
    FOREIGN KEY (GroupMemberUserId) REFERENCES Users(UserId)
);

