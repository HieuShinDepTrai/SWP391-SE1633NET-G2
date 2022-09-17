CREATE TABLE Answer (
  AnswerID      int IDENTITY NOT NULL, 
  AnswerContent nvarchar(max) NULL, 
  QuestionID    int NOT NULL, 
  isCorrect     bit NOT NULL, 
  PRIMARY KEY (AnswerID));
CREATE TABLE Blog (
  BlogID      int IDENTITY NOT NULL, 
  UserID      int NOT NULL, 
  BlogDate    datetime NULL, 
  BlogContent nvarchar(max) NULL, 
  BlogTilte   nvarchar(256) NOT NULL, 
  BlogImage   varbinary(max) NULL, 
  PRIMARY KEY (BlogID));
CREATE TABLE CommentBlog (
  CommentID      int IDENTITY NOT NULL, 
  CommentContent nvarchar(max) NOT NULL, 
  CommentDate    datetime NOT NULL, 
  Likes          int NOT NULL, 
  BlogID         int NOT NULL, 
  isReported     bit NOT NULL, 
  PRIMARY KEY (CommentID));
CREATE TABLE CommentVideo (
  CommentID      int IDENTITY NOT NULL, 
  CommentContent nvarchar(max) NOT NULL, 
  CommentDate    datetime NOT NULL, 
  Likes          int NOT NULL, 
  UserID         int NOT NULL, 
  VideoID        int NOT NULL, 
  isReported     bit NOT NULL, 
  PRIMARY KEY (CommentID));
CREATE TABLE Course (
  CourseID       int IDENTITY NOT NULL, 
  CourseName     nvarchar(200) NOT NULL, 
  DateCreate     datetime NOT NULL, 
  Author         nvarchar(200) NOT NULL, 
  Category       nvarchar(200) NOT NULL, 
  NumberEnrolled int NOT NULL, 
  CoursePrice    float(10) NULL, 
  CourseImage    varbinary(max) NULL, 
  PRIMARY KEY (CourseID));
CREATE TABLE Message (
  [from]     int NOT NULL, 
  [to]       int NOT NULL, 
  created_at datetime NULL, 
  content    nvarchar(max) NULL, 
  CONSTRAINT from_to 
    CHECK ([from] != [to]));
CREATE TABLE Notification (
  NoticeID      int IDENTITY NOT NULL, 
  NoticeContent nvarchar(max) NULL, 
  NoticeDate    datetime NULL, 
  isSeen        bit NOT NULL, 
  PRIMARY KEY (NoticeID));
CREATE TABLE Question (
  QuestionID      int IDENTITY NOT NULL, 
  QuestionContent nvarchar(max) NOT NULL, 
  QuizID          int NOT NULL, 
  PRIMARY KEY (QuestionID));
CREATE TABLE Quiz (
  QuizID   int IDENTITY NOT NULL, 
  CourseID int NOT NULL, 
  Mark     float(10) NULL, 
  PRIMARY KEY (QuizID));
CREATE TABLE Recharge (
  RechargeID   int IDENTITY NOT NULL, 
  RechargeDate datetime NOT NULL, 
  UserID       int NOT NULL, 
  Amount       float(10) NOT NULL, 
  status       bit NOT NULL, 
  PRIMARY KEY (RechargeID));
CREATE TABLE [User] (
  UserID      int IDENTITY NOT NULL, 
  FirstName   nvarchar(30) NOT NULL, 
  LastName    nvarchar(30) NOT NULL, 
  Email       varchar(50) NULL, 
  PhoneNumber varchar(12) NULL, 
  Country     nvarchar(50) NULL, 
  City        nvarchar(50) NULL, 
  Address     nvarchar(200) NULL, 
  DoB         date NOT NULL, 
  PostCode    varchar(10) NULL, 
  Balance     float(10) NULL, 
  Avatar      varbinary(max) NULL, 
  Username    varchar(50) NOT NULL, 
  Password    varchar(64) NOT NULL, 
  Role        nvarchar(50) NOT NULL, 
  PRIMARY KEY (UserID));
CREATE TABLE User_Course (
  UserID         int NOT NULL, 
  CourseID       int NOT NULL, 
  isStudied      bit NOT NULL, 
  CourseRating   float(10) NULL, 
  CourseFeedback nvarchar(max) NULL, 
  Process        float(10) NULL, 
  PayDate        datetime NULL, 
  isFavourite    bit NOT NULL, 
  PRIMARY KEY (UserID, 
  CourseID));
CREATE TABLE User_Notification (
  UserID   int NOT NULL, 
  NoticeID int NOT NULL, 
  PRIMARY KEY (UserID, 
  NoticeID));
CREATE TABLE User_Video (
  UserID    int NOT NULL, 
  VideoID   int NOT NULL, 
  isWatched bit NOT NULL, 
  PRIMARY KEY (UserID, 
  VideoID));
CREATE TABLE Video (
  VideoID   int IDENTITY NOT NULL, 
  CourseID  int NOT NULL, 
  VideoName nvarchar(256) NOT NULL, 
  VideoLink varchar(256) NOT NULL, 
  PRIMARY KEY (VideoID));
CREATE INDEX Answer_AnswerID 
  ON Answer (AnswerID);
CREATE INDEX Blog_BlogID 
  ON Blog (BlogID);
CREATE INDEX CommentVideo_CommentID 
  ON CommentVideo (CommentID);
CREATE INDEX Course_CourseID 
  ON Course (CourseID);
CREATE INDEX Notification_NoticeID 
  ON Notification (NoticeID);
CREATE INDEX Question_QuestionID 
  ON Question (QuestionID);
CREATE INDEX Quiz_QuizID 
  ON Quiz (QuizID);
CREATE INDEX Recharge_RechargeID 
  ON Recharge (RechargeID);
CREATE INDEX User_UserID 
  ON [User] (UserID);
CREATE INDEX Video_VideoID 
  ON Video (VideoID);
ALTER TABLE User_Course ADD CONSTRAINT FKUser_Cours401962 FOREIGN KEY (UserID) REFERENCES [User] (UserID);
ALTER TABLE User_Course ADD CONSTRAINT FKUser_Cours952265 FOREIGN KEY (CourseID) REFERENCES Course (CourseID);
ALTER TABLE Video ADD CONSTRAINT FKVideo487133 FOREIGN KEY (CourseID) REFERENCES Course (CourseID);
ALTER TABLE User_Video ADD CONSTRAINT FKUser_Video483149 FOREIGN KEY (UserID) REFERENCES [User] (UserID);
ALTER TABLE User_Video ADD CONSTRAINT FKUser_Video248293 FOREIGN KEY (VideoID) REFERENCES Video (VideoID);
ALTER TABLE CommentVideo ADD CONSTRAINT FKCommentVid42371 FOREIGN KEY (UserID, VideoID) REFERENCES User_Video (UserID, VideoID);
ALTER TABLE Quiz ADD CONSTRAINT FKQuiz365735 FOREIGN KEY (CourseID) REFERENCES Course (CourseID);
ALTER TABLE Recharge ADD CONSTRAINT FKRecharge738481 FOREIGN KEY (UserID) REFERENCES [User] (UserID);
ALTER TABLE User_Notification ADD CONSTRAINT FKUser_Notif445216 FOREIGN KEY (UserID) REFERENCES [User] (UserID);
ALTER TABLE User_Notification ADD CONSTRAINT FKUser_Notif428842 FOREIGN KEY (NoticeID) REFERENCES Notification (NoticeID);
ALTER TABLE Message ADD CONSTRAINT FKMessage213227 FOREIGN KEY ([from]) REFERENCES [User] (UserID);
ALTER TABLE Message ADD CONSTRAINT FKMessage65145 FOREIGN KEY ([to]) REFERENCES [User] (UserID);
ALTER TABLE Question ADD CONSTRAINT FKQuestion143290 FOREIGN KEY (QuizID) REFERENCES Quiz (QuizID);
ALTER TABLE Answer ADD CONSTRAINT FKAnswer353317 FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID);
ALTER TABLE Blog ADD CONSTRAINT FKBlog360084 FOREIGN KEY (UserID) REFERENCES [User] (UserID);
ALTER TABLE CommentBlog ADD CONSTRAINT FKCommentBlo644738 FOREIGN KEY (BlogID) REFERENCES Blog (BlogID);
